import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/common/app_alert_dialog.dart';
import 'package:tukaatuexpress/features/common/app_error_widget.dart';
import 'package:tukaatuexpress/features/common/app_extension.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';
import 'package:tukaatuexpress/features/common/app_list_view.dart';
import 'package:tukaatuexpress/features/common/app_pop_up_menu.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/common/app_section_divider.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/custom_app_bar.dart';
import 'package:tukaatuexpress/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:tukaatuexpress/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:tukaatuexpress/features/notifications/presentation/screens/widget/empty_notification_state.dart';
import 'package:tukaatuexpress/features/notifications/presentation/screens/widget/notification_shimmer.dart';
import 'package:tukaatuexpress/features/notifications/presentation/screens/widget/notification_summary_card.dart';
import 'package:tukaatuexpress/features/notifications/presentation/screens/widget/notification_tile.dart';
import 'package:tukaatuexpress/gen/assets.gen.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isRegistered = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.neutralBackground,
      appBar: CustomAppBar(
        color: AppColors.black,
        backgroundColor: AppColors.neutralBackground,
        scrolledUnderElevation: 0,
        textStyle: AppTextStyles.textLargeBold.copyWith(fontSize: 18),
        title: 'Notifications',
        actions: [
          AppPopupMenu(
            items: const [
              AppPopupMenuItem(
                iconColor: AppColors.appRed,
                textStyle: TextStyle(color: AppColors.appRed, fontSize: 12),
                icon: Icons.delete,
                value: 'Delete All',
                label: 'Delete All',
              ),
            ],
            onSelected: (value) {
              showDialog<void>(
                context: context,
                builder: (dialogContext) => AppAlertDialog(
                  title: 'Delete all notifications?',
                  content:
                      'Are you sure you want to delete all notifications? This action cannot be undone.',
                  onConfirm: () async {
                    // Delete all notifications
                    final isSuccess = await context
                        .read<NotificationsCubit>()
                        .deleteAllNotifications();
                    if (isSuccess && context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.more_vert_outlined),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return state.theStates.whenOrElse(
            loading: () => const NotificationShimmer(),
            error: () => AppErrorWidget(
              title: 'Failed to load notifications.',
              onTap: () =>
                  context.read<NotificationsCubit>().fetchNotifications(),
            ),
            orElse: () {
              final notifications = state.notifications;
              final unreadCount = state.unreadCount;
              return RefreshIndicator(
                onRefresh: () async {
                  if (isRegistered == true) {
                    await context
                        .read<NotificationsCubit>()
                        .fetchNotifications();
                  }
                },

                /// dif pattern has been applied due to backend jpt response (:))
                child: AppListView(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 28),
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: notifications.length + 2,
                  canLoadMore: state.paginationInfo?.hasMore ?? true,
                  isLoadingMore: state.isLoadingMore,
                  onLoadMore: () =>
                      context.read<NotificationsCubit>().loadMore(),
                  separatorBuilder: (_, index) => index == 0
                      ? const VerticalSpacing(18)
                      : const VerticalSpacing(10),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return NotificationSummaryCard(
                        totalCount: state.paginationInfo?.total ?? 0,
                        unreadCount: unreadCount,
                        onMarkAllRead: () =>
                            context.read<NotificationsCubit>().markAllRead(),
                      );
                    }
                    if (index == 1) {
                      return notifications.isEmpty
                          ? const EmptyNotificationState()
                          : const AppSectionHeader(title: 'Recent Updates');
                    }
                    final item = notifications[index - 2];
                    final isRead = item.isRead ?? false;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Dismissible(
                        key: ValueKey(item.id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          if (item.id != null) {
                            context
                                .read<NotificationsCubit>()
                                .deleteNotification(item.id!);
                          }
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: AppColors.appRed,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.bin.image(
                                height: 18,
                                width: 18,
                                color: AppColors.white,
                              ),
                              const Text(
                                'Delete',
                                style: TextStyle(
                                  color: AppColors.backGroundGrey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: AppInkWell(
                          onTap: () {},
                          child: NotificationTile(
                            isRead: isRead,
                            title: item.title ?? '',
                            message: item.body ?? '',
                            time:
                                item.sentAt?.toIso8601String().formatTimeAgo ??
                                '',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
