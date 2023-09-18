
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const PrimaryText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w600,
    this.size = 16,
    this.overflow = TextOverflow.visible
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight
      ),
    );
  }
}
