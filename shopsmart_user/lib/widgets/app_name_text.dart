import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  final double fontSize;
  const AppNameTextWidget({super.key,  this.fontSize=30});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period:  const Duration(seconds: 20),
        baseColor: Colors.purple,
        highlightColor: Colors.red,
        child:  TitlesTextWidget(label: "Shop smart",fontSize: fontSize));
  }
}
