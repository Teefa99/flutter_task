import 'package:task/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle textXLarge = TextStyle(
    fontSize: 27.sp,
    color: ColorCode.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Dubai',
  );
  static TextStyle textLarge = TextStyle(
    fontSize: 24.sp,
    color: ColorCode.black,
    fontWeight: FontWeight.w700,
    height: 1.0454545454545454,
    fontFamily: 'Dubai',
  );
  static TextStyle textLarge2 = TextStyle(
    fontSize: 20.sp,
    color: ColorCode.black,
    fontWeight: FontWeight.w700,
    height: 1.0454545454545454,
    fontFamily: 'Dubai',
  );
  static const textMedium2 = TextStyle(
    fontSize: 18,
    color: ColorCode.black,
    fontWeight: FontWeight.w600,
    height: 1.2,
    fontFamily: 'Dubai',
  );
  static const textMedium = TextStyle(
    fontSize: 16,
    color: ColorCode.black,
    fontWeight: FontWeight.w500,
    height: 1.2,
    fontFamily: 'Dubai',
  );

  static TextStyle textSmall = TextStyle(
    fontSize: 13.sp,
    height: 1,
    color: ColorCode.black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Dubai',
  );
  static TextStyle textXSmall = TextStyle(
    fontSize: 7.sp,
    color: ColorCode.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Dubai',
  );

  static TextStyle bottomNavBarItemStyle =
      TextStyle(fontFamily: 'Dubai', height: 1, fontSize: 13.sp);
}
