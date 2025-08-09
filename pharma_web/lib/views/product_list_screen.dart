import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  final String screenTitle;
  final List<Product> products;

  const ProductListScreen({
    super.key,
    required this.screenTitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenTitle)),
      body:
          products.isEmpty
              ? const Center(
                child: Text(
                  'No products found.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (ctx, index) {
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
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
                    ),
                  );
                },
              ),
    );
  }
}
