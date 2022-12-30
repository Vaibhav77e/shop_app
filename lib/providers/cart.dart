import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  CardItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

class Card with ChangeNotifier {
  late Map<String, CardItem> _items;
  Map<String, CardItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CardItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CardItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
  }
}
