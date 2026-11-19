import 'package:share_plus/share_plus.dart';
import 'package:tukaatuexpress/constants/app_deep_links.dart';

class AppShare {
  AppShare._();

  static Future<bool> shareProduct(int productId) {
    return _share(
      url: AppDeepLinks.productLinkById(productId),
      title: 'Share Product',
      text: 'Check out this product on Tukaatu!',
    );
  }

  static Future<bool> shareFilm(int filmId) {
    return _share(
      url: AppDeepLinks.filmLinkById(filmId),
      title: 'Share Film',
      text: 'Check out this film on Tukaatu!',
    );
  }

  static Future<bool> shareTalentFilm(int filmId) {
    return _share(
      url: AppDeepLinks.talentFilmLinkById(filmId),
      title: 'Share Talent Film',
      text: 'Check out this talent film on Tukaatu!',
    );
  }

  static Future<bool> shareStore(int filmId) {
    return _share(
      url: AppDeepLinks.storeLinkById(filmId),
      title: 'Share Store',
      text: 'Check out this Store on Tukaatu!',
    );
  }

  static Future<bool> shareCreator(
    int creatorId, {
    bool isForUserCreator = false,
  }) {
    return _share(
      url: AppDeepLinks.creatorLinkById(
        creatorId,
        isForUserCreator: isForUserCreator,
      ),
      title: 'Share Creator',
      text: 'Check out this creator on Tukaatu!',
    );
  }

  static Future<bool> shareApp() {
    return _share(
      url: 'https://tukaatu.com/app/download',
      title: 'Share Tukaatu',
      text: 'Discover amazing films, events, and more on Tukaatu!',
    );
  }

  static Future<bool> _share({
    required String url,
    required String title,
    required String text,
  }) async {
    final result = await SharePlus.instance.share(
      ShareParams(title: title, text: '$text\n\n$url'),
    );

    return result.status == ShareResultStatus.success;
  }
}
