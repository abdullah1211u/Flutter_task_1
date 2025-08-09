import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../utils/app_data.dart';
import 'categories_screen.dart';
import 'product_list_screen.dart';
import 'profile_screen.dart';

class PharmacyHomePage extends StatefulWidget {
  const PharmacyHomePage({super.key});

  @override
  State<PharmacyHomePage> createState() => _PharmacyHomePageState();
}

class _PharmacyHomePageState extends State<PharmacyHomePage> {
  UserModel _user = UserModel(
    name: 'Md Abdullah',
    email: 'abdullah@gmail.com',
    address: '152, Main Street, KHulna',
  );

  void _updateUser(UserModel updatedUser) {
    setState(() {
      _user = updatedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController();
    final List<Category> categories = dummyCategories;

    void navigateToProductList(
      BuildContext ctx,
      String title,
      List<Product> products,
    ) {
      Navigator.push(
        ctx,
        MaterialPageRoute(
          builder:
              (_) => ProductListScreen(screenTitle: title, products: products),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MediCare Pharmacy',
          style: TextStyle(color: Color.fromARGB(255, 232, 78, 7)),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cart is empty!')));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color.fromARGB(255, 231, 83, 9),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome, ${_user.name}!',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 231, 83, 9),
              ),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 231, 83, 9),
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ProfileScreen(user: _user, onSave: _updateUser),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.medical_services,
                color: Color.fromARGB(255, 231, 83, 9),
              ),
              title: const Text('Order Medicines'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 231, 83, 9),
              ),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 231, 83, 9),
              ),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for medicines, health products...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 231, 83, 9),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onSubmitted: (query) {
                  final results = controller.searchProducts(query);
                  navigateToProductList(
                    context,
                    'Results for "$query"',
                    results,
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Popular Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 231, 83, 9),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (ctx, index) {
                    final category = categories[index];
                    return _buildCategoryCard(
                      context,
                      category.name,
                      category.icon,
                      () {
                        final products = controller.getProductsByCategory(
                          category.id,
                        );
                        navigateToProductList(context, category.name, products);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Promotional Banner
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://www.menap-smi.org/wp-content/uploads/title-banner-The-Role-of-the-Pharmacist-in-Self-Care-and-Self-Medication.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 231, 83, 9)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Color.fromARGB(255, 231, 83, 9)),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pharmacy,
              color: Color.fromARGB(255, 231, 83, 9),
            ),
            label: 'Pharmacies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 231, 83, 9)),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Home - do nothing, already here
              break;
            case 1:
              // Navigate to Categories Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CategoriesScreen()),
              );
              break;
            case 2:
              // Can be used for a "Find Pharmacies" screen later
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pharmacies coming soon!')),
              );
              break;
            case 3:
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ProfileScreen(user: _user, onSave: _updateUser),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 100,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.teal),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
