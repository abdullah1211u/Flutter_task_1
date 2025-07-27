import 'package:flutter/material.dart';

void main() {
  runApp(const PharmacyApp());
}

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediCare Pharmacy',
      theme: ThemeData(
        primarySwatch: Colors.teal, // A common color for healthcare
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PharmacyHomePage(),
    );
  }
}

class PharmacyHomePage extends StatelessWidget {
  const PharmacyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MediCare Pharmacy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              // TODO: Navigate to Cart Screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cart functionality coming soon!'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // TODO: Navigate to Notifications Screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications.')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Order Medicines'),
              onTap: () {
                // TODO: Navigate to Order Medicines Screen
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Navigating to Order Medicines.'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Prescriptions'),
              onTap: () {
                // TODO: Navigate to Prescriptions Screen
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigating to Prescriptions.')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_pharmacy),
              title: const Text('Find Pharmacies'),
              onTap: () {
                // TODO: Navigate to Find Pharmacies Screen
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Navigating to Find Pharmacies.'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                // TODO: Navigate to Help & Support Screen
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Navigating to Help & Support.'),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Navigate to Settings Screen
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigating to Settings.')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Implement Logout Logic
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Logged out.')));
              },
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
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for medicines, health products...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onSubmitted: (query) {
                  // TODO: Implement search functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Searching for: $query')),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Quick Actions/Categories
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildQuickActionButton(
                    context,
                    icon: Icons.upload_file,
                    label: 'Upload Prescription',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Upload Prescription tapped!'),
                        ),
                      );
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.local_shipping,
                    label: 'Track Order',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Track Order tapped!')),
                      );
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.chat,
                    label: 'Consult Doctor',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Consult Doctor tapped!')),
                      );
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.wallet,
                    label: 'Payments',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Payments tapped!')),
                      );
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.health_and_safety,
                    label: 'Health Articles',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Health Articles tapped!'),
                        ),
                      );
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.local_offer,
                    label: 'Offers',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Offers tapped!')),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Featured Products/Categories (example)
              const Text(
                'Popular Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard(
                      context,
                      'Cough & Cold',
                      Icons.medication_liquid,
                    ),
                    _buildCategoryCard(
                      context,
                      'Pain Relief',
                      Icons.medication,
                    ),
                    _buildCategoryCard(context, 'Skin Care', Icons.spa),
                    _buildCategoryCard(
                      context,
                      'Vitamins',
                      Icons.local_florist,
                    ),
                    _buildCategoryCard(context, 'Baby Care', Icons.child_care),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Promotions/Banners (example)
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://via.placeholder.com/400x150/FFD700/FFFFFF?text=Summer+Sale+20%25+Off',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Special Discount on All Medicines!',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Placeholder for more content like "Recently Ordered" or "Recommended"
              const Text(
                'Recommended for You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // You would typically fetch and display dynamic product lists here
              Container(
                height: 150,
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: const Text('Product Recommendation Cards Go Here'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Pharmacies',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // TODO: Implement navigation for bottom navigation bar
          switch (index) {
            case 0:
              // Already on Home
              break;
            case 1:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Categories.')),
              );
              break;
            case 2:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Pharmacies.')),
              );
              break;
            case 3:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigating to Profile.')),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on $title category!')),
            );
            // TODO: Navigate to category products screen
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
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
