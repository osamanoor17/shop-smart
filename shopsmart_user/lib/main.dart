import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/cart-provider.dart';
import 'package:shopsmart_user/providers/products_provider.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/providers/viewed_recently_provider.dart';
import 'package:shopsmart_user/providers/wishlist_provider.dart';
import 'package:shopsmart_user/screens/auth/register_screen.dart';
import 'package:shopsmart_user/screens/inner_screens/product_details.dart';
import 'package:shopsmart_user/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_user/screens/inner_screens/wishlist_screen.dart';
import 'package:shopsmart_user/screens/search/search_screen.dart';

import 'consts/theme_data.dart';
import 'screens/auth/forgot_password.dart';
import 'screens/auth/login_screen.dart';
import 'screens/inner_screens/orders/orders_screen.dart';
import 'screens/root_screen.dart';

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
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductsProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_){
          return WishlistProvider();
        }),
        ChangeNotifierProvider(create: (_){
          return ViewedProdProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop Smart USER',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const LoginScreen(),
          // home: RootScreen(),
          routes: {
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            RootScreen.routeName: (context) => const RootScreen(),
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            WishListScreen.routeName: (context) => const WishListScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      }),
    );
  }
}
