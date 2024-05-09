import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String wishlistId;
  final String productId;


  WishlistModel(
      {required this.wishlistId,
      required this.productId,
      });
}
