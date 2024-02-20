import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/consts/app_colors.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.lightscafoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text("Hello World",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: () {}, child: const Text("Hello World")),
            SwitchListTile(
                value: themeProvider.getIsDarkTheme,
                onChanged: (value) {
                  themeProvider.setDarkTheme(value);
                })
          ],
        ),
      ),
    );
  }
}
