import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  const SubtitleTextWidget(
      {super.key,
      required this.label,
      this.fontSize = 16,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.textDecoration = TextDecoration.none,
      });

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
            fontSize: fontSize,
            decoration: textDecoration,
            color: color,
            fontStyle: fontStyle,
            fontWeight: fontWeight));
  }
}
