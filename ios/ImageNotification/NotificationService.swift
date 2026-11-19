import FirebaseMessaging
import UserNotifications

final class NotificationService: UNNotificationServiceExtension {
  private var contentHandler: ((UNNotificationContent) -> Void)?
  private var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(
    _ request: UNNotificationRequest,
    withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
    self.contentHandler = contentHandler

    guard let mutableContent = request.content.mutableCopy() as? UNMutableNotificationContent else {
      contentHandler(request.content)
      return
    }

    bestAttemptContent = mutableContent
    Messaging.serviceExtension().populateNotificationContent(
      mutableContent,
      withContentHandler: contentHandler
    )
  }

  override func serviceExtensionTimeWillExpire() {
    guard let contentHandler, let bestAttemptContent else { return }
    contentHandler(bestAttemptContent)
  }
}
