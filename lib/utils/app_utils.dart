import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppUtils {
  static void unfocusKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  static void showSnackbar({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.appGreen,
      textColor: AppColors.neutralWhite,
      fontSize: 16,
    );
  }

  static void showErrorSnackbar({
    String message = 'Invalid Url',
    void Function()? onRetry,
    String buttomnText = 'Retry',
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.appRed,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static Future<XFile?> pickImage(BuildContext context) async {
    final source = await showDialog<ImageSource>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black26,
      builder: (dialogContext) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_outlined, color: Colors.grey),
              title: const Text('Pick From Gallery'),
              onTap: () => Navigator.pop(dialogContext, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
              ),
              title: const Text('Take a Picture'),
              onTap: () => Navigator.pop(dialogContext, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null || !context.mounted) return null;

    final picker = ImagePicker();

    return picker.pickImage(source: source);
  }

  static Future<File?> pickMediaOrFileDialog(BuildContext context) async {
    final result = await showDialog<String>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.only(
            bottom: 50.h,
            top: 575.h,
            left: 16.w,
            right: 210.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColors.colorsE9EAEC),
          ),
          backgroundColor: AppColors.neutralWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                'Gallery'.moreTile(
                  onTap: () => Navigator.pop(context, 'gallery'),
                  icon: const Icon(Icons.browse_gallery),
                ),
                const VerticalSpacing(10),
                'Take a photo'.moreTile(
                  icon: const Icon(Icons.camera),
                  onTap: () => Navigator.pop(context, 'camera'),
                ),
                const VerticalSpacing(10),
                'Attach a file'.moreTile(
                  icon: const Icon(Icons.file_copy),
                  onTap: () => Navigator.pop(context, 'file'),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result == null || !context.mounted) return null;

    File? pickedFile;

    if (result == 'gallery') {
      final fileResult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (fileResult != null && fileResult.files.single.path != null) {
        pickedFile = File(fileResult.files.single.path!);
      }
    } else if (result == 'camera') {
      final picker = ImagePicker();

      final pickedImage = await picker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        pickedFile = File(pickedImage.path);
      }
    } else if (result == 'file') {
      final fileResult = await FilePicker.platform.pickFiles();

      if (fileResult != null && fileResult.files.single.path != null) {
        pickedFile = File(fileResult.files.single.path!);
      }
    }

    return pickedFile;
  }

  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}

extension MoreTileExtension on String {
  Widget moreTile({required VoidCallback onTap, required Widget icon}) {
    return ListTile(
      leading: Padding(padding: const EdgeInsets.only(left: 16), child: icon),
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      minVerticalPadding: 0,
      dense: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          this,
          style: AppTextStyles.small30012.copyWith(
            fontSize: 12,
            color: AppColors.black,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

extension NullCheckExtension<T> on T? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension NullEmptyExtension<T> on T? {
  bool get isEmpty {
    if (this == null) return true;

    if (this is String && (this! as String).isEmpty) {
      return true;
    }

    if (this is Iterable && (this! as Iterable).isEmpty) {
      return true;
    }

    if (this is Map && (this! as Map).isEmpty) {
      return true;
    }

    return false;
  }

  bool get isNotEmpty => !isEmpty;
}
