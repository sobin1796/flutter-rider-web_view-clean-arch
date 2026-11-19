import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    required this.title,
    required this.description,
    required this.titleNumber,
    super.key,
  });
  final String titleNumber;
  final String title;
  final String description;

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16),
      childrenPadding: const EdgeInsets.only(left: 16, right: 18, bottom: 20),
      iconColor: AppColors.black,
      collapsedIconColor: AppColors.black,
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColors.black,
      showTrailingIcon: false,
      collapsedBackgroundColor: AppColors.neutralWhite,
      collapsedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      minTileHeight: 125,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleNumber,
            style: AppTextStyles.titleMd,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles.titleMd,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const HorizontalSpacing(8),
              if (isExpanded)
                const Icon(Icons.remove)
              else
                const Icon(Icons.add),
            ],
          ),
        ],
      ),
      onExpansionChanged: (value) {
        isExpanded = value;
        setState(() {});
      },
      children: [
        Text(
          widget.description,
          style: AppTextStyles.textMediumRegular
              .copyWith(color: AppColors.neutralWhite),
        ),
      ],
    );
  }
}
