import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/screens/inner_screens/viewed_recently.dart';
import 'package:shopsmart_user/screens/inner_screens/wishlist_screen.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';
import '../../consts/cus_ListTile.dart';
import '../../providers/theme_provider.dart';
import '../../services/assets_manager.dart';

import '../../widgets/app_name_text.dart';
import '../auth/login_screen.dart';
import '../inner_screens/orders/orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(
          fontSize: 22,
        ),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: TitlesTextWidget(
                    label: "Please login to have unlimited access"),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.background,
                            width: 3),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://i.ibb.co/NnJvgYq/profile.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "ADMIN"),
                        SizedBox(
                          height: 2,
                        ),
                        SubtitleTextWidget(label: "admin@gmail.com")
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitlesTextWidget(label: "General"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomListTile(
                      text: 'All Orders',
                      imagePath: AssetsManager.orderSvg,
                      function: () {
                        Navigator.pushNamed(context, OrdersScreenFree.routeName);
                      }),
                  CustomListTile(
                      text: 'Wishlist',
                      imagePath: AssetsManager.wishlistSvg,
                      function: () {
                        Navigator.pushNamed(context, WishListScreen.routeName);
                      }),
                  CustomListTile(
                      text: 'Viewed Recently',
                      imagePath: AssetsManager.recent,
                      function: () {
                        Navigator.pushNamed(
                            context, ViewedRecentlyScreen.routeName);
                      }),
                  CustomListTile(
                      text: 'Address',
                      imagePath: AssetsManager.address,
                      function: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitlesTextWidget(label: "Settings"),
                  const SizedBox(
                    height: 5,
                  ),
                  SwitchListTile(
                      secondary: Image.asset(
                        AssetsManager.theme,
                        height: 35,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Dark Mode"
                          : "Light Mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TitlesTextWidget(label: "General"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomListTile(
                      text: 'Privacy & Policy',
                      imagePath: AssetsManager.privacy,
                      function: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                      onPressed: () async {
                         Navigator.pushNamed(context, LoginScreen.routeName);
                  // await MyAppFunctions.showErrorOrWarningDialog(
                  //     context: context,
                  //     subtitle: "Are you sure you want to signout",
                  //     fct: () {},
                  //     isError: false,);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
