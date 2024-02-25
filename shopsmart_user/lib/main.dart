import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/screens/auth/register_screen.dart';
import 'package:shopsmart_user/screens/inner_screens/product_details.dart';
import 'package:shopsmart_user/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_user/screens/inner_screens/wishlist_screen.dart';
import 'package:shopsmart_user/screens/root_screen.dart';

import 'consts/theme_data.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop Smart',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const LoginScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            WishListScreen.routeName: (context) =>
            const WishListScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
            const ViewedRecentlyScreen(),
            RegisterScreen.routeName: (context) =>
            const RegisterScreen(),
          },
        );
      }),
    );
  }
}
