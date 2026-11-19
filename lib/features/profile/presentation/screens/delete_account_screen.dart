import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';
import 'package:tukaatuexpress/features/common/app_bottom_spacing.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/custom_app_bar.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';
import 'package:tukaatuexpress/utils/auth_utills.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool _understood = false;
  bool _isDeleting = false;

  static const _conditions = [
    'All your personal data will be permanently deleted.',
    'Your order history and saved addresses will be removed.',
    'Any active bids or listings will be cancelled.',
    'Your bookmarked products will be lost.',
    'This action cannot be undone.',
  ];

  void _confirmDelete() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Confirm Delete Account'),
        content: const Text(
          'Are you absolutely sure? Your account and all associated data will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _deleteAccount();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: AppColors.appRed),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteAccount() async {
    if (_isDeleting) return;
    final profileCubit = context.read<ProfileCubit>();
    final preferences = getIt<Preferences>();
    setState(() => _isDeleting = true);
    try {
      final deleted = await profileCubit.deactivateAccount();
      if (!deleted) return;

      await preferences.deleteString(Preference.accessToken);
      AuthUtils.notifyAuthChanged();
      await preferences.deleteString(Preference.lastSyncedFcmToken);

      profileCubit.enableLogout();
      if (mounted) {
        setState(() => _isDeleting = false);
        context.pop();
      }
    } catch (_) {
      AppUtils.showErrorSnackbar(
        message: 'Unable to complete account deletion. Please try again.',
      );
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isDeleting,
      child: AppScaffold(
        appBar: const CustomAppBar(title: 'Delete Account'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.appRed.withAlpha(15),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.appRed.withAlpha(60)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: AppColors.appRed,
                      size: 28.sp,
                    ),
                    HorizontalSpacing(12.w),
                    Expanded(
                      child: Text(
                        'Deleting your account is permanent and irreversible.',
                        style: AppTextStyles.textMediumSemiBold.copyWith(
                          color: AppColors.appRed,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(24),
              const Text(
                'Before you proceed, please understand:',
                style: AppTextStyles.textMediumSemiBold,
              ),
              const VerticalSpacing(12),
              ..._conditions.map(
                (condition) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 7.sp,
                        color: AppColors.neutralBlack,
                      ),
                      HorizontalSpacing(10.w),
                      Expanded(
                        child: Text(
                          condition,
                          style: AppTextStyles.textMediumRegular.copyWith(
                            color: AppColors.colors6C757D,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpacing(24),
              InkWell(
                onTap: () => setState(() => _understood = !_understood),
                borderRadius: BorderRadius.circular(8.r),
                child: Row(
                  children: [
                    Checkbox(
                      value: _understood,
                      onChanged: (val) =>
                          setState(() => _understood = val ?? false),
                      activeColor: AppColors.appRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'I understand that this action is permanent and cannot be undone.',
                        style: AppTextStyles.textMediumRegular,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _understood && !_isDeleting
                      ? _confirmDelete
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appRed,
                    disabledBackgroundColor: AppColors.appRed.withAlpha(80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    _isDeleting ? 'Deleting...' : 'Delete My Account',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const AppBottomSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
