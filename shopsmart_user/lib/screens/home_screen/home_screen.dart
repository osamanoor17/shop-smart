import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/consts/app_consts.dart';
import 'package:shopsmart_user/providers/theme_provider.dart';
import 'package:shopsmart_user/screens/products/category_rounded_widget.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../widgets/app_name_text.dart';
import '../products/latest_arrival_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Swiper(
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          AppConsts.bannerImages[index],
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 2,
                      pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.red, color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitlesTextWidget(label: "Latest Arrivals"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const LatestArrivalProducts();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitlesTextWidget(label: "Categories"),
                const SizedBox(
                  height: 10,
                ),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children:
                      List.generate(AppConsts.categoriesList.length, (index) {
                    return CategoryRoundedWidget(
                        image: AppConsts.categoriesList[index].image,
                        name: AppConsts.categoriesList[index].name);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
