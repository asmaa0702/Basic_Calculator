import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String? sign;
  double h;
  double w;
  Widget child;
  VoidCallback onPress;
  Color color;
  MyButton({
    super.key,
    this.sign,
    this.h = 70,
    this.w = 70,
    required this.child,
    required this.onPress,
    this.color = const Color(0xFFE491C9),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: this.color,
      ),
      child: IconButton(onPressed: onPress, icon: child),
    );
  }
}
