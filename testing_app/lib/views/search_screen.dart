import '/controllers/product_controller.dart';
import '/models/product.dart';
import '/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> _searchResults = [];

  void _runSearch(String query) {
    final productController = Provider.of<ProductController>(
      context,
      listen: false,
    );
    setState(() {
      _searchResults = productController.searchProducts(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search for products...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: _runSearch,
        ),
      ),
      body:
          _searchResults.isEmpty
              ? const Center(child: Text('No products found.'))
              : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: _searchResults.length,
                itemBuilder:
                    (ctx, i) => ProductItem(product: _searchResults[i]),
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
