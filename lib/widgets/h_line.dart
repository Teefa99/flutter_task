import 'package:task/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HLine extends StatelessWidget {
  const HLine({Key? key, this.color, this.thik, this.padd}) : super(key: key);
  final Color? color;
  final double? thik;
  final double? padd;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padd ?? 10.h),
      child: Container(
        width: double.infinity,
        height: thik ?? 1,
        color: color ?? ColorCode.grey.withOpacity(.4),
      ),
    );
  }
}

class VLine extends StatelessWidget {
  const VLine({Key? key, this.color, this.thik, this.padd, this.height})
      : super(key: key);
  final Color? color;
  final double? thik;
  final double? padd;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padd ?? 10.h),
      child: Container(
        height: height ?? 45.h,
        width: thik ?? 2.w,
        color: color ?? Color(0xFFEAE9E5),
      ),
    );
  }
}
