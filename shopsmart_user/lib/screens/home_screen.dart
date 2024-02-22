import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';

import '../widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
    //  backgroundColor: AppColors.lightscafoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SubtitleTextWidget(label: 'Hello '),
            const TitlesTextWidget(label: 'world',),
            ElevatedButton(onPressed: () {}, child: const Text("Hello World")),
            SwitchListTile(
              title: Text(themeProvider.getIsDarkTheme? "Hello": "World"),
                value: themeProvider.getIsDarkTheme,
                onChanged: (value) {
                  themeProvider.setDarkTheme(themeValue:value);
                })
          ],
        ),
      ),
    );
  }
}
