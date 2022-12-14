import Flutter
import UIKit

public class SwiftAdderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "adder", binaryMessenger: registrar.messenger())
    let instance = SwiftAdderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public static func dummyMethodToEnforceBundling() {
    add(60, 9)
  }
}
