class NotificationEntity {
  const NotificationEntity({
    this.id,
    this.title,
    this.body,
    this.type,
    this.target,
    this.href,
    this.what,
    this.entity,
    this.orderNumber,
    this.storeName,
    this.storeLogo,
    this.productImage,
    this.status,
    this.entityType,
    this.entityId,
    this.isRead,
    this.sentAt,
    this.createdAt,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? type;
  final String? target;
  final String? href;
  final String? what;
  final String? entity;
  final String? orderNumber;
  final String? storeName;
  final String? storeLogo;
  final String? productImage;
  final String? status;
  final String? entityType;
  final String? entityId;
  final bool? isRead;
  final DateTime? sentAt;
  final DateTime? createdAt;

  NotificationEntity copyWith({bool? isRead}) => NotificationEntity(
    id: id,
    title: title,
    body: body,
    type: type,
    target: target,
    href: href,
    what: what,
    entity: entity,
    orderNumber: orderNumber,
    storeName: storeName,
    storeLogo: storeLogo,
    productImage: productImage,
    status: status,
    entityType: entityType,
    entityId: entityId,
    isRead: isRead ?? this.isRead,
    sentAt: sentAt,
    createdAt: createdAt,
  );
}

class NotificationPage {
  const NotificationPage({
    required this.notifications,
    required this.unreadCount,
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  final List<NotificationEntity> notifications;
  final int unreadCount;
  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;

  bool get hasMore => (currentPage ?? 0) < (lastPage ?? 0);

  NotificationPagination get pagination => NotificationPagination(
    currentPage: currentPage,
    lastPage: lastPage,
    perPage: perPage,
    total: total,
  );
}

class NotificationPagination {
  const NotificationPagination({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;

  bool get hasMore => (currentPage ?? 0) < (lastPage ?? 0);
}
