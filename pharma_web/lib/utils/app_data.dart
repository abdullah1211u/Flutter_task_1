import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

// DUMMY CATEGORIES
final List<Category> dummyCategories = [
  Category(id: 'c1', name: 'Cough & Cold', icon: Icons.medication_liquid),
  Category(id: 'c2', name: 'Pain Relief', icon: Icons.medication),
  Category(id: 'c3', name: 'Skin Care', icon: Icons.spa),
  Category(id: 'c4', name: 'Vitamins', icon: Icons.local_florist),
  Category(id: 'c5', name: 'Baby Care', icon: Icons.child_care),
];

// DUMMY PRODUCTS
final List<Product> dummyProducts = [
  Product(id: 'p1', name: 'Napa Syrup', categoryId: 'c1', price: 85),
  Product(id: 'p2', name: 'Tushka', categoryId: 'c1', price: 70),
  Product(id: 'p3', name: 'Adovas', categoryId: 'c1', price: 90),
  Product(id: 'p4', name: 'Paracetamol', categoryId: 'c2', price: 60),
  Product(id: 'p5', name: 'Ibuprofen', categoryId: 'c2', price: 40),
  Product(id: 'p6', name: 'Aspirin', categoryId: 'c2', price: 55),
  Product(id: 'p7', name: 'Moisturizing Lotion', categoryId: 'c3', price: 300),
  Product(id: 'p8', name: 'Sunscreen SPF 50', categoryId: 'c3', price: 600),
  Product(id: 'p9', name: 'Vitamin C Tablets', categoryId: 'c4', price: 299),
  Product(id: 'p10', name: 'Vitamin D Capsules', categoryId: 'c4', price: 389),
  Product(id: 'p11', name: 'Baby Diapers', categoryId: 'c5', price: 300),
  Product(id: 'p12', name: 'Baby Shampoo', categoryId: 'c5', price: 590),
];
