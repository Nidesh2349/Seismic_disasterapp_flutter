import UIKit
import Flutter
import GoogleMaps  // Import Google Maps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Provide the API key for Google Maps
    GMSServices.provideAPIKey("AIzaSyAphoV-zDrm5xJD-GS-j6uvWVUxNe9AgS0")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
