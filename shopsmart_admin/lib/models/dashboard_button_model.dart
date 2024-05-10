import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en/screens/inner_screen/orders/edit_upload_product_form.dart';
import 'package:shopsmart_admin_en/screens/inner_screen/orders/orders_screen.dart';
import 'package:shopsmart_admin_en/screens/search_screen.dart';
import 'package:shopsmart_admin_en/services/assets_manager.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel(
      {required this.text, required this.imagePath, required this.onPressed});

  static List<DashboardButtonsModel> dashboardButtonList(context) => [
    DashboardButtonsModel(
        text: "Add a new product",
        imagePath: AssetsManager.cloud,
        onPressed: () {
          Navigator.pushNamed(context, EditorUploadProductScreen.routeName);
        }),
    DashboardButtonsModel(
        text: "Inspect all products",
        imagePath: AssetsManager.shoppingCart,
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.routeName);
        }),
    DashboardButtonsModel(
        text: "View Orders", imagePath: AssetsManager.order, onPressed: () {
          Navigator.pushNamed(context, OrdersScreenFree.routeName);
        }),
    DashboardButtonsModel(
        text: "View Profile", imagePath: AssetsManager.user, onPressed: () {}),
  ];
}
