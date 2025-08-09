import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../utils/app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController();
    final List<Category> categories = dummyCategories;

    return Scaffold(
      appBar: AppBar(title: const Text('All Categories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          // Get the products for the current category
          final List<Product> products = controller.getProductsByCategory(
            category.id,
          );

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ExpansionTile(
              leading: Icon(category.icon, color: Colors.teal, size: 30),
              title: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children:
                  products.isEmpty
                      ? [
                        const ListTile(
                          title: Text('No products in this category.'),
                        ),
                      ]
                      : products.map((product) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(product.imageUrl),
                            onBackgroundImageError: (exception, stackTrace) {},
                          ),
                          title: Text(product.name),
                          subtitle: Text(
                            'Price: ৳${product.price.toStringAsFixed(2)}',
                          ),
                          trailing: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.teal,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.name} added to cart!'),
                              ),
                            );
                          },
                        );
                      }).toList(),
            ),
          );
        },
      ),
    );
  }
}
