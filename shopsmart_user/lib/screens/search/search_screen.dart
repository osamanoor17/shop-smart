import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_user/models/products_model.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../services/assets_manager.dart';
import '../products/products_widget.dart';

class SearchScreen extends StatefulWidget {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: TitlesTextWidget(label: "Search Products"),
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: Padding(
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
                    )),
              ),
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
                  return  Center(
                    child: ProductsWidget(
                      image: ProductModel.products[index].productImage,
                      title:ProductModel.products[index].productTitle ,
                      price:ProductModel.products[index].productPrice ,
                    ),
                  );
                },
                itemCount: ProductModel.products.length,
                crossAxisCount: 2,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
