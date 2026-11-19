import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';

class AppImageViewer {
  static void showImageDialog(BuildContext context, List<String> images) {
    var currentIndex = 0;
    final controller = PageController();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            void next() {
              if (currentIndex < images.length - 1) {
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            }

            void prev() {
              if (currentIndex > 0) {
                controller.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            }

            return Dialog(
              backgroundColor: AppColors.black,
              insetPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              child: SizedBox(
                height: 425,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                      controller: controller,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        final transformController = TransformationController();
                        return GestureDetector(
                          onDoubleTapDown: (details) {
                            final isZoomed =
                                transformController.value != Matrix4.identity();
                            if (isZoomed) {
                              transformController.value = Matrix4.identity();
                            } else {
                              final position = details.localPosition;
                              transformController.value = Matrix4.identity()
                                ..translate(
                                  -position.dx * 1.5,
                                  -position.dy * 1.5,
                                )
                                ..scale(2.5);
                            }
                          },
                          onDoubleTap: () {},
                          child: InteractiveViewer(
                            transformationController: transformController,
                            minScale: 1,
                            maxScale: 5,
                            child: AppCachedImage(
                              height: double.infinity,
                              imgUrl: images[index],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),

                    // ⬅️ Prev
                    if (currentIndex > 0)
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                          onPressed: prev,
                        ),
                      ),

                    // ➡️ Next
                    if (currentIndex < images.length - 1)
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                          ),
                          onPressed: next,
                        ),
                      ),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: AppColors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
