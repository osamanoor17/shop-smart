// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart' show BuildContext, Icon, Image, ListTile, StatelessWidget, Widget;
import 'package:flutter_iconly/flutter_iconly.dart';
import '../widgets/subtitle_text.dart';

class CustomListTile extends StatelessWidget {
  final String text;
  final String imagePath;
  final Function function;
  const CustomListTile(
      {super.key,
      required this.text,
      required this.imagePath,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 35,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
