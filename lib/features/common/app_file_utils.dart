class AppFileUtils {
  static bool isImageFile(String filePath) {
    final imageExtensions = [
      '.png',
      '.jpg',
      '.jpeg',
      '.gif',
      '.bmp',
      '.webp',
      '.heif',
      '.heic',
      '.tiff',
      '.tif',
      '.ico',
      '.svg',
      '.jfif',
      '.raw',
      '.cr2',
      '.nef',
      '.orf',
      '.sr2',
    ];

    final extension = filePath.toLowerCase();
    return imageExtensions.any((ext) => extension.endsWith(ext));
  }

  static bool isAudiofile(String filePath) {
    final audioExtensions = [
      '.mp3',
      '.m4a',
      '.aac',
      '.wav',
      '.flac',
      '.ogg',
      '.oga',
      '.wma',
      '.alac',
      '.aiff',
      '.amr',
      '.opus',
      '.3gp',
      '.webm',
    ];
    var extension = filePath.toLowerCase();
    return audioExtensions.any((ado) => extension.endsWith(ado));
  }

  static bool isPdfFile(String filePath) {
    final pdfExtensions = [
      '.pdf',
      '.pdfa',
      '.pdfx',
      '.fdf',
      '.xfdf',
      '.xps',
    ];

    final extension = filePath.toLowerCase();
    return pdfExtensions.any((ext) => extension.endsWith(ext));
  }
}
