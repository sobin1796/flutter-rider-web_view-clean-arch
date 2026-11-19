import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tukaatuexpress/core/config/environment_helper.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';
import 'package:tukaatuexpress/features/notifications/domain/repository/notifications_repository.dart';
import 'package:tukaatuexpress/features/notifications/domain/usecase/notifications_usecases.dart';
import 'package:tukaatuexpress/features/profile/domain/repository/profile_repository.dart';
import 'package:tukaatuexpress/features/profile/domain/usecase/profile_usecases.dart';
import 'package:tukaatuexpress/features/splash_info/domain/repository/splash_info_repository.dart';
import 'package:tukaatuexpress/features/splash_info/domain/usecase/fetch_splash_info.dart';

@module
abstract class RegisterModule {
  @injectable
  FetchNotifications fetchNotifications(NotificationsRepository repository) =>
      FetchNotifications(repository);

  @injectable
  DeleteAllNotifications deleteAllNotifications(
    NotificationsRepository repository,
  ) => DeleteAllNotifications(repository);

  @injectable
  DeleteNotification deleteNotification(NotificationsRepository repository) =>
      DeleteNotification(repository);

  @injectable
  MarkNotificationRead markNotificationRead(
    NotificationsRepository repository,
  ) => MarkNotificationRead(repository);

  @injectable
  MarkAllNotificationsRead markAllNotificationsRead(
    NotificationsRepository repository,
  ) => MarkAllNotificationsRead(repository);

  @injectable
  FetchProfile fetchProfile(ProfileRepository repository) =>
      FetchProfile(repository);

  @injectable
  DeactivateAccount deactivateAccount(ProfileRepository repository) =>
      DeactivateAccount(repository);

  @injectable
  FetchSplashInfo fetchSplashInfo(SplashInfoRepository repository) =>
      FetchSplashInfo(repository);

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Preferences preferences(SharedPreferences prefs) => Preferences(prefs);

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  EnvironmentHelper get envHelper => EnvironmentHelper();

  @lazySingleton
  DioApiClient dioApiClient(
    Dio dio,
    EnvironmentHelper helper,
    Preferences prefs,
  ) => DioApiClient(dio, helper, prefs, Dio());
}
