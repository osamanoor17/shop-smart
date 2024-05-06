import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/cart-provider.dart';

import 'cart/cart_screen.dart';
import 'home_screen/home_screen.dart';
import 'profile/profile_screen.dart';
import 'search/search_screen.dart';

class RootScreen extends StatefulWidget {
    static const routeName= '/RootScreen';
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  late PageController controller;
  int currentScreen = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomeScreen(),
      const SearchScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations:  [
          const NavigationDestination(
            icon: Icon(IconlyLight.home),
            label: 'Home',
            selectedIcon: Icon(IconlyBold.home),
          ),
          const NavigationDestination(
            icon: Icon(IconlyLight.search),
            label: 'Search',
            selectedIcon: Icon(IconlyBold.search),
          ),
          NavigationDestination(
            icon: Badge(
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                label: Text(cartProvider.getCartitems.length.toString()),
                child: const Icon(IconlyLight.bag2)),
            label: 'Cart',
            selectedIcon: const Icon(IconlyBold.bag2),
          ),
          const NavigationDestination(
            icon: Icon(IconlyLight.profile),
            label: 'Profile',
            selectedIcon: Icon(IconlyBold.profile),
          ),
        ],
      ),
    );
  }
}
