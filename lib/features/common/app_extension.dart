import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

MediaType detectMimeType(String path) {
  final extension = path.split('.').last.toLowerCase();
  switch (extension) {
    case 'png':
      return MediaType('image', 'png');
    case 'jpg':
    case 'jpeg':
      return MediaType('image', 'jpeg');
    case 'gif':
      return MediaType('image', 'gif');
    case 'webp':
      return MediaType('image', 'webp');
    default:
      return MediaType('application', 'octet-stream');
  }
}

extension StringFormatExtension on String {
  String get numberFormatter {
    final number = int.tryParse(this);

    if (number == null) return this;

    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(number % 1000000000 == 0 ? 0 : 1)}B';
    }

    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(number % 1000000 == 0 ? 0 : 1)}M';
    }

    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(number % 1000 == 0 ? 0 : 1)}K';
    }

    return number.toString();
  }

  String get getFirstThreeWords {
    if (trim().isEmpty) return '';

    return trim().split(RegExp(r'\s+')).take(3).join(' ');
  }
}

extension FileUploadExtension on File {
  /// Converts the file into Dio-compatible FormData for upload
  Future<FormData> toFormData({String fieldName = 'file'}) async {
    final mimeType = lookupMimeType(
      path,
    ); // Detects MIME type like 'image/jpeg'
    final contentType = mimeType != null
        ? MediaType.parse(mimeType)
        : MediaType('application', 'octet-stream'); // Fallback

    final multipartFile = await MultipartFile.fromFile(
      path,
      filename: path.split('/').last,
      contentType: contentType,
    );

    return FormData.fromMap({fieldName: multipartFile});
  }
}

extension MediaUrlExtension on String {
  bool get isVideo {
    final url = toLowerCase();

    return url.endsWith('.mp4') ||
        url.endsWith('.mov') ||
        url.endsWith('.avi') ||
        url.endsWith('.mkv') ||
        url.endsWith('.webm') ||
        url.endsWith('.m4v') ||
        url.contains('video');
  }

  bool get isImage {
    final url = toLowerCase();

    return url.endsWith('.jpg') ||
        url.endsWith('.jpeg') ||
        url.endsWith('.png') ||
        url.endsWith('.gif') ||
        url.endsWith('.webp') ||
        url.endsWith('.bmp') ||
        url.contains('image');
  }
}

extension RupeeFormatExtension on num {
  String toRs() {
    final text = toStringAsFixed(2).replaceFirst(RegExp(r'\.00$'), '');
    return 'Rs. $text';
  }
}

extension StringExtension on String? {
  String get parseHtml {
    if (this == null || this!.isEmpty) {
      return 'Not available';
    }

    return this!
        .replaceAll(RegExp('<[^>]*>'), '') // remove html tags
        .replaceAll('&nbsp;', ' ')
        .trim();
  }

  /// Converts HTML list items into readable bullet lines and strips other tags.
  String get parseHtmlWithBullets {
    final html = this;
    if (html == null || html.trim().isEmpty) return 'Not available';

    final listItemPattern = RegExp(
      r'<li\b[^>]*>(.*?)</li\s*>',
      caseSensitive: false,
      dotAll: true,
    );
    var formatted = html.replaceAllMapped(listItemPattern, (match) {
      final item = _stripHtmlTags(match.group(1)!).trim();
      return item.isEmpty ? '' : '\n• $item\n';
    });

    formatted = formatted
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'</p\s*>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'</?(?:ul|ol)\b[^>]*>', caseSensitive: false), '\n')
        .replaceAll(RegExp('<[^>]*>'), ' ');

    return _decodeHtmlEntities(formatted)
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .join('\n');
  }
}

String _stripHtmlTags(String value) => value
    .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), ' ')
    .replaceAll(RegExp('<[^>]*>'), ' ');

String _decodeHtmlEntities(String value) => value
    .replaceAll('&nbsp;', ' ')
    .replaceAll('&amp;', '&')
    .replaceAll('&lt;', '<')
    .replaceAll('&gt;', '>')
    .replaceAll('&quot;', '"')
    .replaceAll('&#39;', "'");

extension DateTimeStringExtension on String {
  String get formatTimeAndDate {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return this;

    final local = dateTime.toLocal();
    final now = DateTime.now();

    final isToday =
        local.year == now.year &&
        local.month == now.month &&
        local.day == now.day;

    if (isToday) {
      return DateFormat('hh:mm a').format(local);
    }

    final yesterday = now.subtract(const Duration(days: 1));

    final isYesterday =
        local.year == yesterday.year &&
        local.month == yesterday.month &&
        local.day == yesterday.day;

    if (isYesterday) {
      return 'Yesterday, ${DateFormat('hh:mm a').format(local)}';
    }

    if (local.year == now.year) {
      return DateFormat('dd MMM, hh:mm a').format(local);
    }

    return DateFormat('dd MMM yyyy, hh:mm a').format(local);
  }

  /// 14 Jul 2026
  String get formatDate {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return this;
    return DateFormat('dd MMM yyyy').format(dateTime.toLocal());
  }

  /// 10:45 AM
  String get formatTime {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return this;
    return DateFormat('hh:mm a').format(dateTime.toLocal());
  }

  /// e.g. "5 min ago", "2 hr ago", "Yesterday", "14/7/2024"
  String get formatTimeAgo {
    try {
      final dt = DateTime.parse(this).toLocal();
      final diff = DateTime.now().difference(dt);
      if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
      if (diff.inHours < 24) return '${diff.inHours} hr ago';
      if (diff.inDays == 1) return 'Yesterday';
      return '${dt.day}/${dt.month}/${dt.year}';
    } catch (_) {
      return '';
    }
  }

  /// 14 Jul
  String get formatShortDate {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return this;
    return DateFormat('dd MMM').format(dateTime.toLocal());
  }

  /// 14 Jul, 10:45 AM
  String get formatShortDateTime {
    final dateTime = DateTime.tryParse(this);
    if (dateTime == null) return this;
    return DateFormat('dd MMM, hh:mm a').format(dateTime.toLocal());
  }
}

extension StringToIntExtension on String? {
  int get toInt {
    return int.tryParse(this ?? '') ?? 0;
  }
}

extension StringToDoubleExtension on String? {
  double get toDouble {
    return double.tryParse(this ?? '') ?? 0.0;
  }
}

enum DiscountType { flat, percent }

extension DiscountTypeExtension on DiscountType {
  String get value {
    switch (this) {
      case DiscountType.flat:
        return 'flat';
      case DiscountType.percent:
        return 'percent';
    }
  }
}

String generateIdempotencyKey() {
  final random = Random.secure();

  final bytes = List<int>.generate(16, (_) => random.nextInt(256));

  // UUID v4
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;

  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  return '${hex.substring(0, 8)}-'
      '${hex.substring(8, 12)}-'
      '${hex.substring(12, 16)}-'
      '${hex.substring(16, 20)}-'
      '${hex.substring(20, 32)}';
}
