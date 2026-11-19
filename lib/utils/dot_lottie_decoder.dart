import 'package:lottie/lottie.dart';

Future<LottieComposition?> decodeDotLottie(List<int> bytes) {
  return LottieComposition.decodeZip(
    bytes,
    filePicker: (files) {
      for (final file in files) {
        if (file.name.startsWith('animations/') &&
            file.name.endsWith('.json')) {
          return file;
        }
      }
      return null;
    },
  );
}
