import 'package:flutter/material.dart';
import 'package:shopsmart_user/models/cart_model.dart';
import 'package:shopsmart_user/providers/products_provider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartitems {
    return _cartItems;
  }

  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
            cartId: const Uuid().v4(), productId: productId, quantity: 1));
    notifyListeners();
  }

  bool isProdinCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  double getTotal({required ProductsProvider productsProvider}) {
    // Total qeemat ko shuru mein 0.0 par set karte hain
    double total = 0.0;

    // Har item ke liye cart mein loop karte hain
    _cartItems.forEach((key, value) {
      // Current product ki maloomat hasil karte hain
      final getCurrProduct = productsProvider.findByProdId(value.productId);

      // Agar product ki maloomat nahi milti, to total mein kuch nahi add hota
      if (getCurrProduct == null) {
        total += 0;
      }
      // Warna, product ki qeemat ko quantity ke saath multiply karke total mein add karte hain
      else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });

    // Final total ko return karte hain
    return total;
  }

      int getQty(){
        int total =0;
        _cartItems.forEach((key, value) {
          total += value.quantity;
        });
        return total;
      }

}
