import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../consts/app_consts.dart';
import '../inner_screens/product_details.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: AppConsts.imageUrl,
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
                  const Flexible(
                      flex: 9,
                      child: TitlesTextWidget(
                        label: "White Sneakers Shoes",
                        maxLines: 2,
                        fontSize: 18,
                      )),
                  Flexible(
                      flex: 2,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.heart))),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                    flex: 1,
                    child: SubtitleTextWidget(
                      label: "\$1600.00",
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    )),
                Flexible(
                    child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 20,
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
