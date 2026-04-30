import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle baseTextStyle = TextStyle(color: Colors.white, fontSize: 14.sp);

  static TextStyle whiteBold({double? fontSize}) =>
      TextStyle(color: Colors.white, fontSize: fontSize ?? 16.sp, fontWeight: .bold);
}