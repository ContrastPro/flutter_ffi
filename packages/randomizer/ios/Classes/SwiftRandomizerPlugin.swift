import Flutter
import UIKit

public class SwiftRandomizerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "randomizer", binaryMessenger: registrar.messenger())
    let instance = SwiftRandomizerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public static func dummyMethodToEnforceBundling() {
    rust_random()
  }
}
