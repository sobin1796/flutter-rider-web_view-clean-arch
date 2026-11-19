import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_divider.dart';
import 'package:tukaatuexpress/features/common/app_shimmer.dart';

class AppTileShimmer extends StatelessWidget {
  const AppTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, index) => const AppDivider(),
      itemBuilder: (context, index) {
        return const TileShimmerItem();
      },
    );
  }
}

class TileShimmerItem extends StatelessWidget {
  const TileShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),

            // Message details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Time
            Container(
              height: 10,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
