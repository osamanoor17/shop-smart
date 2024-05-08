import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartButton extends StatefulWidget {
  final Color bkgColor;
  final double size;
  const HeartButton(
      {super.key, this.bkgColor = Colors.transparent, this.size = 22});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.bkgColor, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          IconlyLight.heart,
          color: Colors.red,
          size: widget.size,
        ),
      ),
    );
  }
}
