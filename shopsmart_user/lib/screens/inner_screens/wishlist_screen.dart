import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/wishlist_provider.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/services/myapp_functions.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../widgets/empty_bag.dart';
import '../products/products_widget.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = "/WishListScreen";
  const WishListScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlists.isEmpty
        ? Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmptyBag(
            imagePath: AssetsManager.bagWish,
            title: 'No Products in WishList Yet!',
            subtitle:
            '   Looks like your cart is empty \nAdd something & make me happy!!',
            buttonText: 'Shop Now',
          ),
        ))
        : Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: TitlesTextWidget(label: "WishList (${wishlistProvider.getWishlists.length})"),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                        isError: false,
                        context: context,
                        subTitle: "Clear Cart ?",
                        fct: () {
                          wishlistProvider.clearLocalWishlist();
                        });
                  },
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
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ProductsWidget(productId:wishlistProvider.getWishlists.values.toList()[index].productId),
            ),
          );
        },
        itemCount: wishlistProvider.getWishlists.length,
        crossAxisCount: 2,
      ),
    );
  }
}
