import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox(
      {Key? key,
      this.height = 65,
      this.width = 65,
      this.radius = 20,
      this.icon,
      this.iconColor = Colors.white})
      : super(key: key);
  final double height;
  final double width;
  final double radius;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xff23232c),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, color: iconColor, size: 28),
    );
  }
}
