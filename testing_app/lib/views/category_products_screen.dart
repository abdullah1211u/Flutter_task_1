import '/controllers/product_controller.dart';
import '/models/category.dart';
import '/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProductsScreen extends StatelessWidget {
  final Category category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductController>(
      context,
    ).getProductsByCategory(category.id);

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(product: products[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
