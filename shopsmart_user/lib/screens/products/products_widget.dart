import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/cart-provider.dart';
import 'package:shopsmart_user/providers/products_provider.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../inner_screens/product_details.dart';
import 'heart_button.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key, required this.productId});
  final String productId;

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    // final productsModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrentProduct = productsProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                    context, ProductDetailsScreen.routeName,
                    arguments: getCurrentProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.24,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 9,
                            child: TitlesTextWidget(
                              label: getCurrentProduct.productTitle,
                              maxLines: 2,
                              fontSize: 18,
                            )),
                        Flexible(
                          flex: 2,
                          child: HeartButton(
                              // bkgColor: Colors.blue.shade200,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: SubtitleTextWidget(
                            label: "\$ ${getCurrentProduct.productPrice}",
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          )),
                      Flexible(
                          child: Material(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blueAccent,
                        child: InkWell(
                          onTap: () {
                            if (cartProvider.isProdinCart(
                                productId: getCurrentProduct.productId)) {
                              return;
                            }
                            cartProvider.addProductToCart(
                                productId: getCurrentProduct.productId);
                          },
                          splashColor: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              cartProvider.isProdinCart(
                                      productId: getCurrentProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          );
  }
}
