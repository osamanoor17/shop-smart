import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/models/products_model.dart';
import 'package:shopsmart_user/providers/products_provider.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../services/assets_manager.dart';
import '../products/products_widget.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: TitlesTextWidget(label:passedCategory?? "Search Products"),
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: productList.isEmpty
            ? const Center(child: TitlesTextWidget(label: "No Products Found"))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              // setState(() {
                              FocusScope.of(context).unfocus();
                              searchTextController.clear();
                            },
                            child: const Icon(
                              Icons.clear,
                              color: Colors.red,
                            ))),
                    onChanged: (value) {
                      // print("value of the text is $value");
                    },
                    onSubmitted: (value) {
                      // print("value of the text is $value");
                      // print("value of the controller text is ${searchTextController.text}");
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: DynamicHeightGridView(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      builder: (context, index) {
                        return ProductsWidget(
                            productId: productList[index].productId);
                      },
                      itemCount: productList.length,
                      crossAxisCount: 2,
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}
