import 'package:flutter/material.dart';
import 'package:shopsmart_user/widgets/title_text.dart';
import 'subtitle_text.dart';

class EmptyBag extends StatelessWidget {
  final String imagePath, title, subtitle, buttonText;
  const EmptyBag(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          const SizedBox(
            height: 10,
          ),
          const TitlesTextWidget(
            label: 'Whoops!',
            fontSize: 40,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
           SubtitleTextWidget(
            label: title,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
          const SizedBox(
            height: 20,
          ),
           Align(
            alignment: Alignment.center,
            child: SubtitleTextWidget(
              label:
                  subtitle,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // ignore: prefer_const_constructors
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              child:
                   Text(buttonText, style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
