import '/models/category.dart' as model; // FIX: Added 'as model' prefix
import '/models/pharmacy.dart';
import '/models/product.dart';
import 'package:flutter/foundation.dart';

class ProductController with ChangeNotifier {
  final List<Product> _products = [
    // Sample data
    Product(
      id: 'p1',
      name: 'Aspirin',
      description: 'Pain reliever',
      price: 599,
      imageUrl:
          'https://www.sterisonline.com/uploads/blog/main/stsprin_CAT_1753786565.png',
      categoryId: 'c1',
      pharmacyId: 'ph1',
    ),
    Product(
      id: 'p2',
      name: 'Ibuprofen',
      description: 'Pain reliever',
      price: 749,
      imageUrl:
          'https://cdn.rehabfiles.com/sites/oasisorg/wp-content/uploads/2025/05/Ibuprofen-tablets.jpeg',
      categoryId: 'c1',
      pharmacyId: 'ph2',
    ),
    Product(
      id: 'p2',
      name: 'Ibuprofen',
      description: 'Pain reliever',
      price: 749,
      imageUrl:
          'https://cdn.rehabfiles.com/sites/oasisorg/wp-content/uploads/2025/05/Ibuprofen-tablets.jpeg',
      categoryId: 'c1',
      pharmacyId: 'ph3',
    ),
    Product(
      id: 'p3',
      name: 'Vitamin C',
      description: 'Supplement',
      price: 189,
      imageUrl: 'https://placehold.co/400x400/blue/white?text=Vitamin+C',
      categoryId: 'c2',
      pharmacyId: 'ph1',
    ),
    Product(
      id: 'p4',
      name: 'Cough Syrup',
      description: 'For coughs',
      price: 200,
      imageUrl: 'https://placehold.co/400x400/green/white?text=Cough+Syrup',
      categoryId: 'c3',
      pharmacyId: 'ph3',
    ),
    Product(
      id: 'p5',
      name: 'Antacid',
      description: 'Digestive aid',
      price: 600,
      imageUrl: 'https://placehold.co/400x400/purple/white?text=Antacid',
      categoryId: 'c4',
      pharmacyId: 'ph2',
    ),
    Product(
      id: 'p6',
      name: 'Moisturizer',
      description: 'Skin care',
      price: 200,
      imageUrl: 'https://placehold.co/400x400/pink/white?text=Moisturizer',
      categoryId: 'c5',
      pharmacyId: 'ph1',
    ),
    Product(
      id: 'p7',
      name: 'Band-Aids',
      description: 'First aid',
      price: 110,
      imageUrl: 'https://placehold.co/400x400/yellow/white?text=Band-Aids',
      categoryId: 'c6',
      pharmacyId: 'ph3',
    ),
    Product(
      id: 'p8',
      name: 'Antihistamine',
      description: 'Allergy relief',
      price: 100,
      imageUrl: 'https://placehold.co/400x400/brown/white?text=Antihistamine',
      categoryId: 'c7',
      pharmacyId: 'ph2',
    ),
  ];

  final List<model.Category> _categories = [
    // FIX: Used the 'model.' prefix
    model.Category(id: 'c1', name: 'Pain Relief'),
    model.Category(id: 'c2', name: 'Vitamins'),
    model.Category(id: 'c3', name: 'Cold & Flu'),
    model.Category(id: 'c4', name: 'Digestive Health'),
    model.Category(id: 'c5', name: 'Skin Care'),
    model.Category(id: 'c6', name: 'First Aid'),
    model.Category(id: 'c7', name: 'Allergy Relief'),
  ];

  final List<Pharmacy> _pharmacies = [
    Pharmacy(
      id: 'ph1',
      name: 'HealthFirst Pharmacy',
      address: 'Boyra Bazar, Dhaka',
    ),
    Pharmacy(id: 'ph2', name: 'CarePlus Drugs', address: 'New Market, Dhaka'),
    Pharmacy(
      id: 'ph3',
      name: 'The Medicine Shop',
      address: 'Boroshab Market, Dhaka',
    ),
  ];

  List<Product> get products => [..._products];
  List<model.Category> get categories => [
    ..._categories,
  ]; // FIX: Used the 'model.' prefix
  List<Pharmacy> get pharmacies => [..._pharmacies];

  List<Product> getProductsByCategory(String categoryId) {
    return _products.where((p) => p.categoryId == categoryId).toList();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [];
    }
    return _products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<Product> getFavoriteProducts(List<String> favIds) {
    return _products.where((p) => favIds.contains(p.id)).toList();
  }
}
