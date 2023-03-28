import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width = 100,
      this.height = 50,
      this.ontap,
      this.decoration,
      this.child = const Text("Press me"),
      this.margin});

  final double width;
  final double height;
  final VoidCallback? ontap;
  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: decoration,
        child: Center(child: child),
      ),
    );
  }
}
