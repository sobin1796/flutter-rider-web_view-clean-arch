import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

/// specially for delete for comments
class AppPopupMenuDeleteButton extends StatelessWidget {
  const AppPopupMenuDeleteButton({
    required this.onSelected,
    super.key,
    this.onOpened,
    this.onCanceled,
    this.child,
    this.items,
    this.enabled = true,
    this.icon,
    this.iconColor = AppColors.primaryBlue,
    this.backgroundColor = Colors.white,
    this.elevation = 8,
    this.offset = const Offset(0, 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  final ValueChanged<String> onSelected;
  final VoidCallback? onOpened;
  final VoidCallback? onCanceled;

  final Widget? child;
  final List<PopupMenuEntry<String>>? items;

  final bool enabled;
  final IconData? icon;
  final Color iconColor;
  final Color backgroundColor;
  final double elevation;
  final Offset offset;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      enabled: enabled,
      tooltip: '',
      splashRadius: 20,
      enableFeedback: false,
      elevation: elevation,
      color: backgroundColor,
      surfaceTintColor: backgroundColor,
      offset: offset,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      onOpened: onOpened,
      onCanceled: onCanceled,
      onSelected: onSelected,
      itemBuilder: (_) =>
          items ??
          const [
            PopupMenuItem<String>(
              value: 'delete',
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              textStyle: TextStyle(
                color: AppColors.appRed,
                fontWeight: FontWeight.w600,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete, color: AppColors.appRed, size: 20),
                  HorizontalSpacing(8),
                  Text('Delete'),
                ],
              ),
            ),
          ],
      child: child ?? Icon(icon ?? Icons.more_vert, color: iconColor),
    );
  }
}
