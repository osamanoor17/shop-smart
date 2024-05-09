import 'package:flutter/material.dart';

class ViewedProdModel with ChangeNotifier {
  final String viewedProdId;
  final String productId;

  ViewedProdModel(
      {required this.viewedProdId,
      required this.productId,
      });
}
