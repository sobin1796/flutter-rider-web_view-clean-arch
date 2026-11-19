class AppDeepLinks {
  static const String _host = 'api.tukaatu.com';

  static String productLinkById(int id) => 'https://$_host/product/$id';
  static String filmLinkById(int id) => 'https://$_host/film/$id';
  static String talentFilmLinkById(int id) => 'https://$_host/talent-film/$id';
  static String storeLinkById(int id) => 'https://$_host/store/$id';
  static String creatorLinkById(int id, {bool isForUserCreator = false}) =>
      'https://$_host/creator/$id${isForUserCreator ? '?isForUserCreator=true' : ''}';
}
