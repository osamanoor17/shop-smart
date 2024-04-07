import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../widgets/empty_bag.dart';
import '../cart/bottom_checkout.dart';
import '../cart/cart_widget.dart';
import '../products/products_widget.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = "/WishListScreen";
  const WishListScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
        body: EmptyBag(
          imagePath: AssetsManager.bagWish,
          title: 'No Products in WishList Yet!',
          subtitle:
          '   Looks like your cart is empty \nAdd something & make me happy!!',
          buttonText: 'Shop Now',
        ))
        : Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: TitlesTextWidget(label: "WishList (6)"),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        builder: (context, index) {
          return  Center(
            child: ProductsWidget(),
          );
        },
        itemCount: 200,
        crossAxisCount: 2,
      ),
    );
  }
}
