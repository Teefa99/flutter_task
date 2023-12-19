import 'package:task/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:task/widgets/custom_button_container.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color backGroundColor;
  final double elevation;
  final double borderRadius;
  final double width;
  final double height;
  final BoxDecoration? decoration;

  const CustomButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.backGroundColor = ColorCode.primary,
      this.elevation = 1,
      this.borderRadius = 8.0,
      this.decoration,
      this.width = double.infinity,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: TextButton(
        onPressed: onPressed,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: const BorderSide(color: ColorCode.primary)),
          backgroundColor: backGroundColor,
          elevation: elevation,
        ),
        child: child,
      ),
    );
  }
}
