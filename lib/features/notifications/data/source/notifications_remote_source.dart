import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/features/notifications/data/model/notifications_response.dart';

int? _toInt(Object? value) {
  if (value is num) return value.toInt();
  return int.tryParse(value?.toString() ?? '');
}

@injectable
class NotificationRemoteSource {
  const NotificationRemoteSource(this._client);

  final DioApiClient _client;

  Future<void> deleteAllNotification() async {
    await _client.delete<dynamic>(AppEndpoints.marketplaceNotification);
  }

  Future<(ApiResponseForList<AppNotification>, int)> fetchNotifications({
    int page = 1,
  }) async {
    final response = await _client.httpGet<dynamic>(
      AppEndpoints.marketplaceNotifications,
      queryParameters: {'current_page': page, 'per_page': 15},
    );
    final responseData = response['data'] as Map<String, dynamic>;
    final meta = responseData['meta'] as Map<String, dynamic>;
    final unreadCount = _toInt(responseData['unread_count']) ?? 0;
    return (
      ApiResponseForList(
        data: (responseData['data'] as List<dynamic>)
            .map((e) => AppNotification.fromJson(e))
            .toList(),
        paginationInfo: PaginationInfo(
          currentPage: _toInt(meta['current_page']),
          lastPage: _toInt(meta['last_page']),
          perPage: _toInt(meta['per_page']),
          total: _toInt(meta['total']),
        ),
      ),
      unreadCount,
    );
  }

  Future<void> deleteNotification(int id) async {
    await _client.delete<dynamic>(AppEndpoints.marketplaceNotificationById(id));
  }

  Future<void> readNotification(int id) async {
    await _client.patch<dynamic>(
      AppEndpoints.marketplaceNotificationReadById(id),
    );
  }

  Future<void> readAllNotifications() async {
    await _client.patch<dynamic>(AppEndpoints.marketplaceNotificationsReadAll);
  }
}
