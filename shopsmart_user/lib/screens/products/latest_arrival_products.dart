import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../consts/app_consts.dart';
import '../../widgets/subtitle_text.dart';
import '../inner_screens/product_details.dart';
import 'heart_button.dart';

class LatestArrivalProducts extends StatelessWidget {
  const LatestArrivalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName);
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
                    imageUrl: AppConsts.imageUrl,
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
                    const Text(
                      "White Sneakers Shoes",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButton(
                            bkgColor: Colors.blue.shade200,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const FittedBox(
                      child: SubtitleTextWidget(
                        label: "\$16000.00",
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
