import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class LocationAttachmentPreview extends StatelessWidget {
  const LocationAttachmentPreview({
    required this.coordinates,
    this.onRemove,
    this.isSending = false,
    super.key,
  });

  final String coordinates;
  final VoidCallback? onRemove;
  final bool isSending;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 2),
      padding: const EdgeInsets.fromLTRB(10, 9, 8, 9),
      decoration: BoxDecoration(
        color: AppColors.neutralBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: .14)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.location_on_rounded,
              color: AppColors.primaryBlue,
              size: 21,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current location',
                  style: TextStyle(
                    color: AppColors.neutralBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  coordinates,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.neutralGray,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (onRemove != null)
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.neutralGray,
                minimumSize: const Size(32, 32),
                maximumSize: const Size(32, 32),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              visualDensity: VisualDensity.compact,
              tooltip: 'Remove location',
              onPressed: isSending ? null : onRemove,
              icon: const Icon(Icons.close_rounded, size: 17),
            ),
        ],
      ),
    );
  }
}
