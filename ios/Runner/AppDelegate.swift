import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      //  实现iOS端获取电量功能
      //  1.获取FlutterViewController
      let controller = window?.rootViewController as! FlutterViewController
      //  2.创建FlutterMethodChannel
      let methodChannel = FlutterMethodChannel(name: "com.tkm.flutter/battery_level", binaryMessenger: controller.binaryMessenger)
      //  3.监听Flutter端调用的方法
      methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
          //  判断当前方法名称
          guard call.method == "getBatteryInfo" else {
              result(FlutterMethodNotImplemented)
              return
          }
          
          //  获取电量
          let device = UIDevice.current
          device.isBatteryMonitoringEnabled = true
          if device.batteryState == UIDevice.BatteryState.unknown {
              result(FlutterError(code: "N/A", message: "Battery N/A", details: nil))
          } else {
              result(Int(device.batteryLevel * 100))
          }
      }
      
      
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
