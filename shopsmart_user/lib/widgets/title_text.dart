import 'package:flutter/material.dart';

class TitlesTextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  const TitlesTextWidget({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.color,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label,
    maxLines: maxLines,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis
        ));
  }
}
