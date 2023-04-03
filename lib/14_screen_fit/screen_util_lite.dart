import 'dart:ui';

class ScreenUtilLite {

  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double physicalWidth = 0.0;
  static double physicalHeight = 0.0;
  static double dpr = 0.0;
  static double rpx = 0.0;
  static double px = 0.0;

  static void init({double standardWidth = 750}) {
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    //  rpx：小程序屏幕适配方案
    //  将屏幕宽度等分为750份，1份为1rpx
    rpx = screenWidth / standardWidth;

    //  iPhone6：1rpx = 0.5px
    px = screenWidth / standardWidth * 2;
  }

  static double setRpx(num value) => rpx * value;
  static double setPx(num value) => px * value;
}

extension ScreenUtilLiteExt on num {
  double get rpx => ScreenUtilLite.setRpx(this);

  double get px => ScreenUtilLite.setPx(this);
}