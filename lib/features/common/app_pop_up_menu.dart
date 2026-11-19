import 'package:flutter/material.dart';

import 'package:tukaatuexpress/constants/app_colors.dart';

class AppPopupMenuItem<T> {
  const AppPopupMenuItem({
    required this.value,
    required this.label,
    this.icon,
    this.iconColor,
    this.textStyle,
    this.enabled = true,
  });
  final T value;
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final TextStyle? textStyle;
  final bool enabled;
}

class AppPopupMenu<T> extends StatelessWidget {
  const AppPopupMenu({
    required this.items,
    required this.onSelected,
    super.key,
    this.child,
    this.tooltip = 'More options',
    this.offset = const Offset(-148, -36),
    this.borderRadius = 12,
    this.padding = const EdgeInsets.all(8),
    this.iconColor = AppColors.primaryBlue,
    this.iconSize = 20,
  });

  final List<AppPopupMenuItem<T>> items;
  final ValueChanged<T> onSelected;

  /// Widget that opens the popup.
  final Widget? child;
  final String tooltip;
  final Offset offset;
  final double borderRadius;
  final EdgeInsets padding;

  /// Used only when [child] is null.
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: offset,
      clipBehavior: Clip.antiAlias,
      style: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        surfaceTintColor: const WidgetStatePropertyAll(AppColors.white),
        elevation: const WidgetStatePropertyAll(20),
        shadowColor: WidgetStatePropertyAll(
          AppColors.black.withValues(alpha: 0.32),
        ),
        fixedSize: const WidgetStatePropertyAll(Size.fromWidth(148)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      menuChildren: items.map((item) {
        final itemIconColor = item.iconColor ?? iconColor;
        return MenuItemButton(
          onPressed: item.enabled ? () => onSelected(item.value) : null,
          clipBehavior: Clip.antiAlias,
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size(140, 52)),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed) ||
                  states.contains(WidgetState.hovered)) {
                return AppColors.primaryBlue.withValues(alpha: 0.1);
              }
              return Colors.transparent;
            }),
          ),
          leadingIcon: item.icon == null
              ? null
              : Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: itemIconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item.icon, color: itemIconColor, size: 15),
                ),
          child: Text(
            item.label,
            style:
                item.textStyle ??
                const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
          ),
        );
      }).toList(),
      builder: (context, controller, child) {
        return Tooltip(
          message: tooltip,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child:
                  child ??
                  Padding(
                    padding: padding,
                    child: Icon(
                      Icons.more_vert,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}
