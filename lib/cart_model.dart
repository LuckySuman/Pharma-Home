import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    [
      'Voltaren',
      "14.75",
      "https://dr9wvh6oz7mzp.cloudfront.net/i/0320281efab3cb871622c03d02c9930d_ra,w380,h380_pa,w380,h380.jpg",
      Colors.transparent,
    ],
    [
      "2 layer Mask",
      "5.50",
      "https://images.pexels.com/photos/4052158/pexels-photo-4052158.jpeg?auto=compress&cs=tinysrgb&w=600",
      Colors.transparent
    ],
    [
      "Docs kids D3",
      "20.50",
      "https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/drb/drb00546/v/24.jpg",
      Colors.transparent
    ],
    [
      "Advil",
      "12.50",
      "https://assets.beauty.shoppersdrugmart.ca/bb-prod-product-image/62107004909/en/01/front/800/white.jpg",
      Colors.transparent,
    ],
    [
      "Otrivin",
      "12.80",
      "https://dr9wvh6oz7mzp.cloudfront.net/i/6a90d93d02a1c1887f5ba3f2964b0d17_ra,w380,h380_pa,w380,h380.jpg",
      Colors.transparent
    ],
    [
      "Claritin",
      "15.50",
      "https://assets.beauty.shoppersdrugmart.ca/bb-prod-product-image/56219981142/en/01/front/800/white.jpg",
      Colors.transparent
    ],

    [
      "Dettol Sanitiser",
      "20.50",
      "https://images.pexels.com/photos/4107974/pexels-photo-4107974.jpeg?auto=compress&cs=tinysrgb&w=600",
      Colors.transparent
    ],
    [
      "Centrum Kids",
      "5.50",
      "https://assets.beauty.shoppersdrugmart.ca/bb-prod-product-image/60815516660/en/01/front/800/white.jpg",
      Colors.transparent
    ],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
