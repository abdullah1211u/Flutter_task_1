import '/models/product.dart';
import 'package:flutter/foundation.dart';

class CartController with ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => {..._items};

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void addItem(Product product) {
    _items.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
