import '/controllers/auth_controller.dart';
import '/controllers/cart_controller.dart';
import '/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final cartController = Provider.of<CartController>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              authController.isFavorite(product.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              authController.toggleFavorite(product.id);
            },
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cartController.addItem(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added ${product.name} to cart!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cartController.removeItem(product.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback in case image fails to load
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.medication, color: Colors.grey, size: 50),
              ),
            );
          },
        ),
      ),
    );
  }
}