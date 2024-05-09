import 'package:flutter/material.dart';
import 'package:shopsmart_user/models/viewed_products_model.dart';
import 'package:uuid/uuid.dart';

class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewedProdModel> _viewedProdItems = {};
  Map<String, ViewedProdModel> get getViewedProds {
    return _viewedProdItems;
  }
  
  void addViewedProd({required String productId}) {
    
    _viewedProdItems.putIfAbsent(
          productId,
          () => 
       ViewedProdModel( viewedProdId: const Uuid().v4(), productId: productId)
          );
    notifyListeners();
  }

    void clearLocalViewedProd() {
    _viewedProdItems.clear();
    notifyListeners();
  }

  
}
