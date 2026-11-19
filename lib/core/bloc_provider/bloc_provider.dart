import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/features/home/presentation/cubit/home_cubit.dart';
import 'package:tukaatuexpress/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_cubit.dart';

final List<BlocProvider> blocProviders = [
  BlocProvider<ProfileCubit>(create: (_) => getIt<ProfileCubit>()),
  BlocProvider<NotificationsCubit>(create: (_) => getIt<NotificationsCubit>()),
  BlocProvider<HomeCubit>(create: (_) => getIt<HomeCubit>()),
];
