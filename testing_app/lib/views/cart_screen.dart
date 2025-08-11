import '/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'BDT${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: const Text('ORDER NOW'),
                    onPressed: () {
                      // Implement order logic
                      cart.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order placed!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final product = cart.items.values.toList()[i];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(product.imageUrl),
                    ),
                    title: Text(product.name),
                    subtitle: Text('Price: BDT${product.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        cart.removeItem(product.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
