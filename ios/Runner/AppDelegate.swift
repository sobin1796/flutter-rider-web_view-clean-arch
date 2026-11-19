import Flutter
import UIKit
import FirebaseCore
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure()

    // Allow notifications to be presented while the app is in foreground
    UNUserNotificationCenter.current().delegate = self

    return super.application(
      application,
      didFinishLaunchingWithOptions: launchOptions
    )
  }

  func didInitializeImplicitFlutterEngine(
    _ engineBridge: FlutterImplicitEngineBridge
  ) {
    GeneratedPluginRegistrant.register(
      with: engineBridge.pluginRegistry
    )
    let settingsChannel = FlutterMethodChannel(
      name: "tukaatu/settings",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    settingsChannel.setMethodCallHandler { call, result in
      guard call.method == "videoMemoryInfo" else {
        result(FlutterMethodNotImplemented)
        return
      }
      let memory = ProcessInfo.processInfo.physicalMemory
      result([
        "totalMem": NSNumber(value: memory),
        "isLowRamDevice": memory <= 3 * 1024 * 1024 * 1024
      ])
    }
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler:
      @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([
      .banner,
      .sound,
      .badge,
      .list
    ])
  }
}
