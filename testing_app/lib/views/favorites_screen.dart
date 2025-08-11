import '/controllers/auth_controller.dart';
import '/controllers/product_controller.dart';
import '/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final favoriteIds = authController.user?.favoriteProductIds ?? [];
    final favoriteProducts = Provider.of<ProductController>(
      context,
      listen: false,
    ).getFavoriteProducts(favoriteIds);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body:
          favoriteProducts.isEmpty
              ? const Center(child: Text('You have no favorites yet.'))
              : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: favoriteProducts.length,
                itemBuilder:
                    (ctx, i) => ProductItem(product: favoriteProducts[i]),
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
