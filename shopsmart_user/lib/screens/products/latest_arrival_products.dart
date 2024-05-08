import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/models/products_model.dart';
import 'package:shopsmart_user/providers/cart-provider.dart';

import '../../widgets/subtitle_text.dart';
import '../inner_screens/product_details.dart';
import 'heart_button.dart';

class LatestArrivalProducts extends StatelessWidget {
  const LatestArrivalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productsModel = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName,
              arguments: productsModel.productId);
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.productImage,
                    height: size.height * 0.42,
                    width: size.width * 0.24,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      productsModel.productTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          const HeartButton(
                              // bkgColor: Colors.blue.shade200,
                              ),
                          IconButton(
                            onPressed: () {
                              if (cartProvider.isProdinCart(
                                  productId: productsModel.productId)) {
                                return;
                              }
                              cartProvider.addProductToCart(
                                  productId: productsModel.productId);
                            },
                            icon: Icon(
                              cartProvider.isProdinCart(
                                      productId: productsModel.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                              size: 22,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "\$${productsModel.productPrice}",
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
