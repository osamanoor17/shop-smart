import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/viewed_recently_provider.dart';
import 'package:shopsmart_user/services/assets_manager.dart';
import 'package:shopsmart_user/services/myapp_functions.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../widgets/empty_bag.dart';

import '../products/products_widget.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProdProvider.getViewedProds.isEmpty
        ? Scaffold(
            body: EmptyBag(
            imagePath: AssetsManager.orderBag,
            title: 'No Viewed Products Yet!',
            subtitle:
                '   Looks like your cart is empty \nAdd something & make me happy!!',
            buttonText: 'Shop Now',
          ))
        : Scaffold(
            appBar: AppBar(
              // ignore: prefer_const_constructors
              title: TitlesTextWidget(label: "Viewed Recently (${viewedProdProvider.getViewedProds.length})"),

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
                        subTitle: "Clear Viewed Products ?",
                        fct: () {
                          viewedProdProvider.clearLocalViewedProd();
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
                return  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductsWidget(productId: viewedProdProvider.getViewedProds.values.toList()[index].productId,),
                  ),
                );
              },
              itemCount: viewedProdProvider.getViewedProds.length,
              crossAxisCount: 2,
            ),
          );
  }
}
