// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tukaatuexpress/core/config/environment_helper.dart' as _i893;
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart' as _i976;
import 'package:tukaatuexpress/core/preferences/preferences.dart' as _i632;
import 'package:tukaatuexpress/features/home/data/repository/home_repository_impl.dart'
    as _i215;
import 'package:tukaatuexpress/features/home/data/source/home_remote_source.dart'
    as _i419;
import 'package:tukaatuexpress/features/home/domain/repository/home_repository.dart'
    as _i62;
import 'package:tukaatuexpress/features/home/domain/usecase/home_usecases.dart'
    as _i965;
import 'package:tukaatuexpress/features/home/presentation/cubit/home_cubit.dart'
    as _i162;
import 'package:tukaatuexpress/features/login/data/repository/login_repository_impl.dart'
    as _i403;
import 'package:tukaatuexpress/features/login/data/source/login_remote_source.dart'
    as _i332;
import 'package:tukaatuexpress/features/login/domain/repository/login_repository.dart'
    as _i132;
import 'package:tukaatuexpress/features/login/domain/usecase/login_usecases.dart'
    as _i349;
import 'package:tukaatuexpress/features/login/presentation/cubit/login_cubit.dart'
    as _i431;
import 'package:tukaatuexpress/features/map/presentation/cubit/map_cubit.dart'
    as _i781;
import 'package:tukaatuexpress/features/notifications/data/repository/notifications_repository_impl.dart'
    as _i997;
import 'package:tukaatuexpress/features/notifications/data/source/notifications_remote_source.dart'
    as _i513;
import 'package:tukaatuexpress/features/notifications/domain/repository/notifications_repository.dart'
    as _i774;
import 'package:tukaatuexpress/features/notifications/domain/usecase/notifications_usecases.dart'
    as _i19;
import 'package:tukaatuexpress/features/notifications/presentation/cubit/notifications_cubit.dart'
    as _i240;
import 'package:tukaatuexpress/features/profile/data/repository/profile_repository_impl.dart'
    as _i112;
import 'package:tukaatuexpress/features/profile/data/source/profile_remote_source.dart'
    as _i308;
import 'package:tukaatuexpress/features/profile/domain/repository/profile_repository.dart'
    as _i379;
import 'package:tukaatuexpress/features/profile/domain/usecase/profile_usecases.dart'
    as _i1049;
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_cubit.dart'
    as _i1044;
import 'package:tukaatuexpress/features/splash_info/data/repository/splash_info_repository_impl.dart'
    as _i150;
import 'package:tukaatuexpress/features/splash_info/data/source/splash_info_remote_source.dart'
    as _i963;
import 'package:tukaatuexpress/features/splash_info/domain/repository/splash_info_repository.dart'
    as _i825;
import 'package:tukaatuexpress/features/splash_info/domain/usecase/fetch_splash_info.dart'
    as _i610;
import 'package:tukaatuexpress/features/splash_info/presentation/cubit/splash_info_cubit.dart'
    as _i115;
import 'package:tukaatuexpress/Injectable/register_module.dart' as _i5;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i431.LoginCubit>(() => _i431.LoginCubit());
    gh.factory<_i781.MapCubit>(() => _i781.MapCubit());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i893.EnvironmentHelper>(() => registerModule.envHelper);
    gh.lazySingleton<_i132.LoginRepository>(
      () => const _i403.LoginRepositoryImpl(),
    );
    gh.factory<_i349.LoginWithPhonePassword>(
      () => _i349.LoginWithPhonePassword(gh<_i132.LoginRepository>()),
    );
    gh.lazySingleton<_i632.Preferences>(
      () => registerModule.preferences(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i976.DioApiClient>(
      () => registerModule.dioApiClient(
        gh<_i361.Dio>(),
        gh<_i893.EnvironmentHelper>(),
        gh<_i632.Preferences>(),
      ),
    );
    gh.factory<_i419.HomeRemoteSource>(
      () => _i419.HomeRemoteSource(gh<_i976.DioApiClient>()),
    );
    gh.factory<_i332.LoginRemoteSource>(
      () => _i332.LoginRemoteSource(gh<_i976.DioApiClient>()),
    );
    gh.factory<_i513.NotificationRemoteSource>(
      () => _i513.NotificationRemoteSource(gh<_i976.DioApiClient>()),
    );
    gh.factory<_i308.ProfileRemoteSource>(
      () => _i308.ProfileRemoteSource(gh<_i976.DioApiClient>()),
    );
    gh.factory<_i963.SplashInfoRemoteSource>(
      () => _i963.SplashInfoRemoteSource(gh<_i976.DioApiClient>()),
    );
    gh.lazySingleton<_i825.SplashInfoRepository>(
      () => _i150.SplashInfoRepositoryImpl(gh<_i963.SplashInfoRemoteSource>()),
    );
    gh.lazySingleton<_i379.ProfileRepository>(
      () => _i112.ProfileRepositoryImpl(gh<_i308.ProfileRemoteSource>()),
    );
    gh.factory<_i610.FetchSplashInfo>(
      () => registerModule.fetchSplashInfo(gh<_i825.SplashInfoRepository>()),
    );
    gh.lazySingleton<_i774.NotificationsRepository>(
      () => _i997.NotificationsRepositoryImpl(
        gh<_i513.NotificationRemoteSource>(),
      ),
    );
    gh.lazySingleton<_i62.HomeRepository>(
      () => _i215.HomeRepositoryImpl(gh<_i419.HomeRemoteSource>()),
    );
    gh.factory<_i1049.FetchProfile>(
      () => registerModule.fetchProfile(gh<_i379.ProfileRepository>()),
    );
    gh.factory<_i1049.DeactivateAccount>(
      () => registerModule.deactivateAccount(gh<_i379.ProfileRepository>()),
    );
    gh.singleton<_i1044.ProfileCubit>(
      () => _i1044.ProfileCubit(
        fetchProfile: gh<_i1049.FetchProfile>(),
        deactivateAccount: gh<_i1049.DeactivateAccount>(),
      ),
    );
    gh.factory<_i19.FetchNotifications>(
      () => registerModule.fetchNotifications(
        gh<_i774.NotificationsRepository>(),
      ),
    );
    gh.factory<_i19.DeleteAllNotifications>(
      () => registerModule.deleteAllNotifications(
        gh<_i774.NotificationsRepository>(),
      ),
    );
    gh.factory<_i19.DeleteNotification>(
      () => registerModule.deleteNotification(
        gh<_i774.NotificationsRepository>(),
      ),
    );
    gh.factory<_i19.MarkNotificationRead>(
      () => registerModule.markNotificationRead(
        gh<_i774.NotificationsRepository>(),
      ),
    );
    gh.factory<_i19.MarkAllNotificationsRead>(
      () => registerModule.markAllNotificationsRead(
        gh<_i774.NotificationsRepository>(),
      ),
    );
    gh.factory<_i115.SplashInfoCubit>(
      () => _i115.SplashInfoCubit(fetchSplashInfo: gh<_i610.FetchSplashInfo>()),
    );
    gh.factory<_i240.NotificationsCubit>(
      () => _i240.NotificationsCubit(
        fetchNotifications: gh<_i19.FetchNotifications>(),
        deleteAllNotifications: gh<_i19.DeleteAllNotifications>(),
        deleteNotification: gh<_i19.DeleteNotification>(),
        markNotificationRead: gh<_i19.MarkNotificationRead>(),
        markAllNotificationsRead: gh<_i19.MarkAllNotificationsRead>(),
      ),
    );
    gh.factory<_i965.FetchHome>(
      () => _i965.FetchHome(gh<_i62.HomeRepository>()),
    );
    gh.factory<_i162.HomeCubit>(
      () => _i162.HomeCubit(fetchHome: gh<_i965.FetchHome>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
