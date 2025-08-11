import '/controllers/product_controller.dart';
import '/views/category_products_screen.dart';
import '/views/search_screen.dart';
import '/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '/models/category.dart'; // FIX: Imported Category model

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    final categories = productController.categories;
    final pharmacies = productController.pharmacies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Pharmacy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder:
                    (ctx, i) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (_) => CategoryProductsScreen(
                                  category: categories[i],
                                ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              categories[i].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Pharmacies',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pharmacies.length,
              itemBuilder:
                  (ctx, i) => Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(pharmacies[i].name),
                      subtitle: Text(pharmacies[i].address),
                      leading: const Icon(
                        Icons.local_hospital,
                        color: Colors.red,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
