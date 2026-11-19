class AppEndpoints {
  static const String marketplaceCustomerOtpSend =
      '/marketplace/customer/otp/send';
  static const String marketplaceCustomerOtpVerify =
      '/marketplace/customer/otp/verify';
  static const String marketplaceCustomerEmailRegister =
      '/marketplace/customer/auth/email/register';
  static const String marketplaceCustomerEmailLogin =
      '/marketplace/customer/auth/email/login';
  static const String marketplaceCustomerEmailOtpVerify =
      '/marketplace/customer/auth/email/otp/verify';
  static const String marketplaceCustomerEmailOtpSend =
      '/marketplace/customer/auth/email/otp/send';
  // Profile section
  static const String marketplaceCustomerLogin = '/marketplace/customer/login';
  static const String marketplaceSearch = '/marketplace/search';
  static const String marketplaceRecommendedProducts =
      '/marketplace/recommended-products';
  static const String marketplaceFilmsFeed = '/marketplace/films/feed';
  static const String marketplaceFilmsAllFeed = '/marketplace/films/all-feed';
  static const String mobileFilmsAds = '/mobile/films/ads';
  static String marketplaceFilmsClickById(int id) =>
      '/marketplace/films/$id/click';
  static const String marketplaceCustomerMe = '/marketplace/customer/me';
  static const String marketplaceCustomerProfile =
      '/marketplace/customer/profile';
  static const String marketplaceCustomerAddress =
      '/marketplace/customer/addresses';
  static String marketplaceCustomerAddressById(int id) =>
      '/marketplace/customer/addresses/$id';

  /// product profile
  static String marketplaceProductsSimilarBYid(int id) =>
      '/marketplace/products/$id/similar';
  static String marketplaceStoresFollowById(int id) =>
      '/marketplace/stores/$id/follow';
  static String marketplaceProductsById(int id) => '/marketplace/products/$id';
  static String marketplaceCategoriesBySlug(String slug) =>
      '/marketplace/categories/$slug/products';
  static String marketplaceBrandsBySlug(String slug) =>
      '/marketplace/brands/$slug/products';
  static String marketplaceProductsCommentsById(int id) =>
      '/marketplace/products/$id/comments';
  static String marketplaceProductsMarkById(int id) =>
      '/marketplace/products/$id/mark';
  static String marketplaceFilmsById(int id) => '/marketplace/films/$id';
  static String marketplaceFilmsMark(int id) => '/marketplace/films/$id/mark';
  static String marketplaceFilmsComments(int id) =>
      '/marketplace/films/$id/comments';
  static String marketplaceFilmsCommentsDelete(int id) =>
      '/marketplace/films/comments/$id';

  static String marketplaceProductsComments(int id) =>
      '/marketplace/products/$id/comments';

  static String marketplaceComments(int id) => '/marketplace/comments/$id';
  // Store profile section
  static String marketplaceStoresById(int id) => '/marketplace/stores/$id';
  static String marketplaceStoresSearchByCode(int code) =>
      '/marketplace/stores/$code/search';
  static String marketplaceStoresProductsById(int id) =>
      '/marketplace/stores/$id/products';
  static String marketplaceStoresFilmsById(int id) =>
      '/marketplace/stores/$id/films';
  static String marketplaceStoresCategoryProducts(
    int storeId,
    int categoryId,
  ) => '/marketplace/stores/$storeId/categories/$categoryId/products';
  static String marketplaceCategoriesSubcategoriesById(int id) =>
      '/marketplace/categories/$id/subcategories';
  static String marketplaceBrandProducts(String idOrSlug) =>
      '/marketplace/brands/$idOrSlug/products';
  static String marketplaceCategoryByIdOrSlug(String idOrSlug) =>
      '/marketplace/categories/$idOrSlug/';
  // home feeds
  static const String marketplaceFeedMobile = '/marketplace/feed/mobile';
  static const String marketplacePopups = '/marketplace/popups';
  static const String marketplaceSliders = '/marketplace/feed-ads';
  // spins
  static const String marketplaceSpins = '/marketplace/spins';
  static String marketplaceSpinDraw(int id) => '/marketplace/spins/$id/draw';
  static const String marketplaceSpinRewards = '/marketplace/spin-rewards';
  static const String marketplaceSpinRewardsPreview =
      '/marketplace/spin-rewards/preview';
  // cart
  static const String marketplaceCustomerCart = '/marketplace/customer/cart';
  static String marketplaceCustomerCartById(int id) =>
      '/marketplace/customer/cart/$id';
  // checkout
  static const String marketplaceCouponsValidate =
      '/marketplace/coupons/validate';
  static const String marketplaceCustomerCheckOutPlaceOrder =
      '/marketplace/customer/checkout/place-order';
  static const String marketPlaceCoupons = '/marketplace/coupons';
  static const String marketPlaceCustomerBuyNowPreview =
      '/marketplace/customer/buy-now/preview';

  // Hamro pay
  static const String marketPlaceHamropayInitiate =
      '/marketplace/hamropay/initiate';
  static const String marketPlaceHamropayVerify =
      '/marketplace/hamropay/verify';
  static const String marketplaceCustomerDeactivate =
      '/marketplace/customer/deactivate';
  static const String marketplaceCustomerOrders =
      '/marketplace/customer/orders';
  static String marketplaceCustomerOrdersById(int id) =>
      '/marketplace/customer/orders/$id';
  static String marketplaceCustomerOrdersCancelById(int id) =>
      '/marketplace/customer/orders/$id/cancel';
  //Tukaatu api
  static const String marketplaceCustomerMarks = '/marketplace/customer/marks';
  static const String marketplaceMusic = '/marketplace/music';
  static const String marketplaceEvents = '/marketplace/events';
  static String marketplaceEventBySlug(String slug) =>
      '/marketplace/events/$slug';
  static String marketplaceEventVideoVote(int id) =>
      '/marketplace/events/videos/$id/vote';
  static String marketplaceEventVideoComments(int id) =>
      '/marketplace/events/videos/$id/comments';
  static String marketplaceEventTicketBook(String slug) =>
      '/marketplace/events/$slug/tickets/book';
  static String marketplaceEventTicketVerify(String slug) =>
      '/marketplace/events/$slug/tickets/verify';
  static const String marketplaceCollaboratorEvents =
      '/marketplace/collaborator/events';
  static String marketplaceEventMyTickets(String slug) =>
      '/marketplace/events/$slug/my-tickets';
  static const String marketplaceSearchSuggested =
      '/marketplace/search/suggested';
  static const String marketplaceCustomerFcmToken = '/marketplace/fcm-token';
  static const String marketplaceNotification = '/marketplace/notifications';
  static const String marketplaceNotifications =
      '/marketplace/notifications/mine';
  static String marketplaceNotificationById(int id) =>
      '/marketplace/notifications/$id';
  static String marketplaceNotificationReadById(int id) =>
      '/marketplace/notifications/$id/read';
  static const String marketplaceNotificationsReadAll =
      '/marketplace/notifications/read-all';
  //message
  static const String marketplaceConversations = '/marketplace/conversations';
  static String marketplaceConversationsById(int id) =>
      '/marketplace/conversations/$id';
  static String marketplaceConversationOnlineMembers(int id) =>
      '/marketplace/conversations/$id/online-members';
  static String marketplaceConversationMessagesById(int id) =>
      '/marketplace/conversations/$id/messages';
  static String marketplaceMessagesById(int id) => '/marketplace/messages/$id';

  static const String marketplaceConversationsCheck =
      '/marketplace/conversations/check';
  static const String marketplaceConversationsCheckProduct =
      '/marketplace/conversations/check-product';
  static const String marketplaceConversationsCheckOrder =
      '/marketplace/conversations/check-order';
  static const String marketplaceConversationBlocks =
      '/marketplace/conversation-blocks';
  static const String marketplaceConversationBlocksToggle =
      '/marketplace/conversation-blocks/toggle';

  // Customer-to-customer direct messages
  static const String marketplaceDirectMessages =
      '/marketplace/direct-messages';
  static const String marketplaceDirectMessageCustomerSearch =
      '/marketplace/direct-messages/customers/search';
  static String marketplaceDirectMessagesById(int conversationId) =>
      '/marketplace/direct-messages/$conversationId';
  static String marketplaceDirectMessagesMessageById(int conversationId) =>
      '/marketplace/direct-messages/messages/$conversationId';
  static String marketplaceDirectMessagesReadById(int conversationId) =>
      '/marketplace/direct-messages/$conversationId/read';
  static String marketplaceDirectMessagesArchiveById(int conversationId) =>
      '/marketplace/direct-messages/$conversationId/archive';
  static String marketplaceDirectMessagesMessagesById(int conversationId) =>
      '/marketplace/direct-messages/$conversationId/messages';
  static const String marketplaceDirectMessageBlocks =
      '/marketplace/direct-messages/blocks';
  static String marketplaceDirectMessageBlocksByCustomerId(int customerId) =>
      '/marketplace/direct-messages/blocks/$customerId';
  static const String publicPricingEstimate = '/public/pricing/estimate';
  static const String marketPlaceCreatorInsights =
      '/marketplace/creator/insights';
  static String marketPlaceCreatorStatsById(int id) =>
      '/marketplace/creators/$id/stats';
  static const String marketplaceReports = '/marketplace/reports';
  static const String marketplaceCampaigns = '/marketplace/campaigns';
  static String marketplaceCampaignById(int id) => '/marketplace/campaigns/$id';
  static String marketplaceCampaignBids(int id) =>
      '/marketplace/campaigns/$id/bids';
  static const String marketplaceMyBids = '/marketplace/bids';
  static String marketplaceBidFilmsUploadUrl(int bidId) =>
      '/marketplace/bids/$bidId/films/upload-url';
  static String marketplaceBidFilmsConfirmUpload(int bidId) =>
      '/marketplace/bids/$bidId/films/confirm-upload';
  static String marketplaceCreatorById(int id) => '/marketplace/creators/$id';
  static String marketplaceTalentsById(int id) => '/marketplace/talents/$id';
  static String marketplaceCreatorFollowById(int id) =>
      '/marketplace/creators/$id/follow';
  static String marketplaceTalentsFollowById(int id) =>
      '/marketplace/talents/$id/follow';
  static String marketplaceCreatorFilmsById(int id) =>
      '/marketplace/creators/$id/films';
  static String marketplaceTalentFilmsById(int id) =>
      '/marketplace/talents/$id/films';
  static String marketplaceCreatorBidFilms(int bidId) =>
      '/marketplace/creator/bids/$bidId/films';
  static const String marketplaceTalentsFilms = '/marketplace/talent-films';
  static const String marketplaceTalentsFilmsFeed =
      '/marketplace/talent-films/feed';
  static String marketplaceTalentFilmById(int id) =>
      '$marketplaceTalentsFilms/$id';
  static String talentFilmMark(String identifier) =>
      '$marketplaceTalentsFilms/${Uri.encodeComponent(identifier)}/mark';
  static String talentFilmMarkStatus(String identifier) =>
      '$marketplaceTalentsFilms/${Uri.encodeComponent(identifier)}/mark-status';
  static String talentFilmComments(String identifier) =>
      '$marketplaceTalentsFilms/${Uri.encodeComponent(identifier)}/comments';
  static String talentFilmComment(int id) =>
      '$marketplaceTalentsFilms/comments/$id';
  static const String marketplaceCreatorFilms = '/marketplace/creator/films';
  static const String marketplaceComponents = '/marketplace/components';
  static String marketplaceComponentProducts(int id) =>
      '$marketplaceComponents/$id/products';
  static const String marketplaceCreatorInsights =
      '/marketplace/creator/insights';

  /// User interaction
  static const String marketplaceInterActions = '/marketplace/interactions';

  /// other api
  static const String login = '/auth/login';
  static const String splashInfoImageLink = '/mobile/splash';
  static const String authRegisterRequestForgotPassword =
      '/auth/register/request-forgot-password';
  static const String authVerifyForgotPassword =
      '/auth/verify-forgot-password/';
  static const String authResetPassword = '/auth/reset-password';
  static const String authRegisterVerification = '/auth/register/verification';
  static const String onboarding = '/onboarding/';
  static const String fileUploaderUpload = '/file-uploader/upload';
  static const String card = '/card/';
  static const String userUserProfile = '/user/user-profile';
  static const String user = '/user/';
  static const String label = '/label/';
  static const String userChangePassword = '/user/change-password';
  static const String supportRegister = '/support/register';
  static const String connectionCreate = '/connection/create';
  static const String connection = '/connection';
  static const String labelCreate = '/label/create';
  static const String labelLabels = '/label/labels';
  static const String userProfileRegister = '/user/profile/register';
  static const String userProfileAll = '/user/profile/all';
  // Offers & festival
  static const String marketplaceOffers = '/marketplace/offers';
  static String marketOffersBYId(int id) => 'marketplace/offers/$id';
  static String marketOffersProductsBYId(int id) =>
      '/marketplace/offers/$id/products';
  static String marketOffersSearchBYId(int id) =>
      '/marketplace/offers/$id/search';
  static String marketOffersStoreBYId(int id) =>
      '/marketplace/offers/$id/stores';
  //Args api end points
  static String marketPlaceCustomerCartBYId(int id) =>
      '/marketplace/customer/cart/$id';
  static String userProfile(int id) => '/user/profile/$id';
  static String labelAvailableConnections(int labelId) =>
      '/label/$labelId/available-connections';
  static String labelMyConnections(int labelId) =>
      '/label/$labelId/my-connections';
  static String labelNewConnections(int labelId) =>
      '/label/$labelId/new-connection';
  static String labelName(int labelId) => '/label/$labelId/name';
  static String connectionFavourite(int labelId) =>
      '/connection/$labelId/favorite';
  static String connectionRating(int id) => '/connection/$id/rating';
  static String labelRemoveConnection(int id) => '/label/$id/remove-connection';
  // films watch
  static String marketPlaceFilmsWatchProgressBYId(int id) =>
      '/marketplace/films/$id/watch-progress';
  static String marketPlaceFilmsViewBYId(int id) =>
      '/marketplace/films/$id/view';
  static const String marketPlaceFilmsView = '/marketplace/cart/updates';

  // upload video

  static const String marketPlaceTalentUploadUrl =
      '/marketplace/talent-films/upload-url';
  static const String marketPlaceTalentConfirmUpload =
      '/marketplace/talent-films/confirm-upload';
}

class ExternalEndpoints {}
