import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextAlign textAlign;
  final int maxLines;

  const CustomText(this.text,{
    Key? key,
    this.color = Colors.black,
    this.size = 16,
    this.maxLines = 1,
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight));
  }
}