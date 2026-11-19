import 'package:flutter/material.dart';

class AppBottomSheet {
  /// Number of app bottom sheets currently presented through this helper.
  static int activeSheetCount = 0;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    double heightFactor = 0.9,
  }) async {
    activeSheetCount++;
    try {
      return await showModalBottomSheet<T>(
        context: context,
        isScrollControlled: isScrollControlled,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) {
          final mediaQuery = MediaQuery.of(sheetContext);
          final bottomInset = mediaQuery.viewInsets.bottom;
          final sheetHeight = mediaQuery.size.height * heightFactor;
          return Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Stack(
              children: [
                // Transparent scrim that closes the sheet when tapped
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    excludeFromSemantics: true,
                    onTap: () => Navigator.pop(sheetContext),
                    child: Container(color: Colors.transparent),
                  ),
                ),
                // The actual bottom sheet — absorbs taps so scrim doesn't fire
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: sheetHeight,
                      width: double.infinity,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } finally {
      activeSheetCount--;
    }
  }
}
