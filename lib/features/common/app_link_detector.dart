class AppLinkUtils {
  AppLinkUtils._();

  static final RegExp _urlRegex = RegExp(
    r'(?:(?:https?|ftp):\/\/)?'
    r'(?:www\.)?'
    r'(?:[a-zA-Z0-9-]+\.)+'
    '[a-zA-Z]{2,}'
    r'(?::\d+)?'
    r'(?:\/[^\s<>]*)?',
    caseSensitive: false,
  );

  /// Returns true if the text contains at least one URL.
  static bool containsLink(String text) {
    return _urlRegex.hasMatch(text);
  }

  /// Returns all URLs found in the text.
  static List<String> extractLinks(String text) {
    return _urlRegex
        .allMatches(text)
        .map((match) => _cleanUrl(match.group(0)!))
        .toList();
  }

  /// Returns the first URL found in the text.
  static String? extractFirstLink(String text) {
    final match = _urlRegex.firstMatch(text);

    if (match == null) return null;

    return _cleanUrl(match.group(0)!);
  }

  /// Checks whether the given value itself is a URL.
  static bool isLink(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) return false;

    final match = _urlRegex.firstMatch(trimmed);

    return match != null && match.group(0) == trimmed;
  }

  /// Adds https:// when the URL doesn't have a scheme.
  static String normalize(String url) {
    final trimmed = url.trim();

    if (trimmed.startsWith('http://') ||
        trimmed.startsWith('https://') ||
        trimmed.startsWith('ftp://')) {
      return trimmed;
    }

    return 'https://$trimmed';
  }

  static String _cleanUrl(String url) {
    var result = url;

    while (result.isNotEmpty &&
        r'.,!?;:)\]}'.contains(result[result.length - 1])) {
      result = result.substring(0, result.length - 1);
    }

    return result;
  }
}
