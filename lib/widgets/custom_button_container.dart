
import 'package:flutter/cupertino.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onTabbed;
  final Widget? child;
  final Color? color;

  final double? width;
  final double? height;
  final  BorderRadiusGeometry? borderRadius;
  const MainButton(
      {super.key,
        required this.onTabbed,
        this.borderRadius,
        required this.child,
        required this.color,
        required this.width,
        required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabbed,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius:borderRadius?? BorderRadius.circular(8.0),
          color: color,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

