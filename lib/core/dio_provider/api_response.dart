import 'package:tukaatuexpress/core/dio_provider/api_error.dart';

class ApiResponse<T> {
  const ApiResponse({this.message, this.data});

  final String? message;

  final T? data;
}

class ApiResponseForList<T> {
  ApiResponseForList({this.data, this.paginationInfo});

  ApiResponseForList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <T>[]; // Initialize the list with the correct type T
      json['data'].forEach((dynamic v) {
        data!.add(v as T); // Typecast v as T and add it to the list
      });
    }
    paginationInfo = PaginationInfo.fromResponse(json);
  }
  List<T>? data;
  PaginationInfo? paginationInfo;

  ApiResponseForList<T> copyWith({List<T>? data}) {
    return ApiResponseForList<T>(data: data ?? this.data);
  }
}

class ApiFeedResponseForList<T> {
  ApiFeedResponseForList({this.data, this.feedPaginationInfo});

  ApiFeedResponseForList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <T>[]; // Initialize the list with the correct type T
      json['data'].forEach((dynamic v) {
        data!.add(v as T); // Typecast v as T and add it to the list
      });
    }
    feedPaginationInfo = FeedPaginationInfo.fromResponse(json);
  }
  List<T>? data;
  FeedPaginationInfo? feedPaginationInfo;

  ApiFeedResponseForList<T> copyWith({List<T>? data}) {
    return ApiFeedResponseForList<T>(data: data ?? this.data);
  }
}

class ApiFilmResponseForList<T> {
  ApiFilmResponseForList({this.data, this.filmsPaginationInfo});

  ApiFilmResponseForList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <T>[];
      for (final item in json['data']) {
        data!.add(item as T);
      }
    }

    filmsPaginationInfo = json['meta'] != null
        ? FilmsPaginationInfo.fromResponse(json['meta'] as Map<String, dynamic>)
        : null;
  }

  List<T>? data;
  FilmsPaginationInfo? filmsPaginationInfo;

  ApiFilmResponseForList<T> copyWith({
    List<T>? data,
    FilmsPaginationInfo? filmsPaginationInfo,
  }) {
    return ApiFilmResponseForList<T>(
      data: data ?? this.data,
      filmsPaginationInfo: filmsPaginationInfo ?? this.filmsPaginationInfo,
    );
  }
}

class ApiErrorResponse extends AppError {
  ApiErrorResponse({super.message});
}

class PaginationInfo {
  PaginationInfo({this.currentPage, this.lastPage, this.perPage, this.total});

  factory PaginationInfo.fromResponse(Map<String, dynamic> response) {
    return PaginationInfo(
      currentPage: response['current_page'] as int?,
      lastPage: response['last_page'] as int?,
      perPage: response['per_page'] as int?,
      total: response['total'] as int?,
    );
  }

  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;

  bool get hasMore => (currentPage ?? 0) < (lastPage ?? 0);

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
      'total': total,
    };
  }
}

class FeedPaginationInfo {
  FeedPaginationInfo({this.nextCursor, this.hasMore});
  factory FeedPaginationInfo.fromResponse(Map<String, dynamic> response) {
    final meta = response['meta'] as Map<String, dynamic>?;
    return FeedPaginationInfo(
      nextCursor: meta?['next_cursor'] as String?,
      hasMore: meta?['has_more'] as bool?,
    );
  }
  final String? nextCursor;
  final bool? hasMore;
  Map<String, dynamic> toJson() {
    return {'next_cursor': nextCursor, 'has_more': hasMore};
  }
}

class FilmsPaginationInfo {
  FilmsPaginationInfo({
    this.perPage,
    this.nextCursor,
    this.prevCursor,
    this.hasMore,
  });
  factory FilmsPaginationInfo.fromResponse(Map<String, dynamic> response) {
    return FilmsPaginationInfo(
      perPage: response['per_page'],
      nextCursor: response['next_cursor'] as String?,
      prevCursor: response['prev_cursor'] as String?,
      hasMore: response['has_more'] as bool?,
    );
  }
  final dynamic perPage;
  final String? nextCursor;
  final String? prevCursor;
  final bool? hasMore;

  Map<String, dynamic> toJson() {
    return {
      'per_page': perPage,
      'next_cursor': nextCursor,
      'prev_cursor': prevCursor,
      'has_more': hasMore,
    };
  }
}
