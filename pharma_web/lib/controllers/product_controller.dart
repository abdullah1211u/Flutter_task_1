import '../models/product_model.dart';
import '../utils/app_data.dart';

class ProductController {
  List<Product> getAllProducts() {
    return dummyProducts;
  }

  List<Product> getProductsByCategory(String categoryId) {
    return dummyProducts
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [];
    }
    return dummyProducts
        .where(
          (product) => product.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
