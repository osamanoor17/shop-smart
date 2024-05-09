import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/products_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/product_widget.dart';
import '../widgets/title_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

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

  List<ProductModel> productListSearch = [];
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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsManager.shoppingCart,
            ),
          ),
          title: TitlesTextWidget(label: passedCategory ?? "Search products"),
        ),
        body: productList.isEmpty
            ? const Center(child: TitlesTextWidget(label: "No product found"))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // setState(() {
                            FocusScope.of(context).unfocus();
                            searchTextController.clear();
                            // });
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     productListSearch = productsProvider.searchQuery(
                      //         searchText: searchTextController.text);
                      //   });
                      // },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productsProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                        child: TitlesTextWidget(label: "No products found"),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        builder: (context, index) {
                          return ProductWidget(
                            productId: searchTextController.text.isNotEmpty
                                ? productListSearch[index].productId
                                : productList[index].productId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
