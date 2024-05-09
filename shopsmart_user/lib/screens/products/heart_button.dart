import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_user/providers/wishlist_provider.dart';

class HeartButton extends StatefulWidget {
  final Color bkgColor;
  final String productId;
  final double size;
  //final bool? isinWishlist;
  const HeartButton({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 22,
    required this.productId,
    // this.isinWishlist =false
  });

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  @override
  Widget build(BuildContext context) {
    final wishlistsProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(color: widget.bkgColor, shape: BoxShape.circle),
      child: IconButton(
          onPressed: () {
            wishlistsProvider.addorRemoveFromWishlist(
                productId: widget.productId);
          },
          icon: Icon(
              wishlistsProvider.isProdinWishlist(productId: widget.productId)
                  ? IconlyBold.heart
                  : IconlyLight.heart),color: wishlistsProvider.isProdinWishlist(productId: widget.productId)?
                  Colors.red : Colors.grey,
          iconSize: widget.size),
    );
  }
}
