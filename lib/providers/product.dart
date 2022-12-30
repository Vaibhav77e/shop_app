import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavoriates;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavoriates = false});

  void toggleFavoriatesStatus() {
    isFavoriates = !isFavoriates;
    notifyListeners(); //basically works like a setstate()
  }
}
