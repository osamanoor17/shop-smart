import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/cart-provider.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/widgets/title_text.dart';
import '../../widgets/empty_bag.dart';
import 'bottom_checkout.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    //  final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
     
    return cartProvider.getCartitems.isEmpty
        ? Scaffold(
            body: EmptyBag(
            imagePath: AssetsManager.shoppingBasket,
            title: 'Your Cart is Empty',
            subtitle:
                '   Looks like your cart is empty \nAdd something & make me happy!!',
            buttonText: 'Shop Now',
          ))
        : Scaffold(
            bottomSheet: const CartBottomSheetWidget(),
            appBar: AppBar(
              // ignore: prefer_const_constructors
              title: TitlesTextWidget(
                  label: "MY Cart (${cartProvider.getCartitems.length})"),
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
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.getCartitems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(value: cartProvider.getCartitems.values.toList()[index],
                        child: const CartWidget());
                      }),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          );
  }
}
