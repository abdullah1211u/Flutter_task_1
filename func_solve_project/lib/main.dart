import 'package:flutter/material.dart';

void main() {
  runApp(const PharmaApp());
}

class PharmaApp extends StatelessWidget {
  const PharmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter', // Using Inter font as per instructions
        appBarTheme: AppBarTheme(
          // Enhanced AppBarTheme
          backgroundColor: Colors.teal.shade700, // A slightly darker teal
          foregroundColor: Colors.white,
          elevation: 8, // Increased elevation for a more prominent shadow
          shadowColor: Colors.black.withOpacity(0.3), // A subtle shadow color
          centerTitle: true, // Ensure title is always centered
          titleTextStyle: const TextStyle(
            // Custom title text style
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
          toolbarHeight: 70, // Slightly taller app bar
          shape: const RoundedRectangleBorder(
            // Maintain rounded bottom corners
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Slightly larger radius
            ),
          ),
        ),
      ),
      home: const MainScreen(), // Starts with MainScreen
    );
  }
}

// --- Drug Model ---
class Drug {
  final String id;
  final String name;
  final String genericName;
  final String dosage;
  final String manufacturer;
  final String description;
  final List<String> sideEffects;
  final String category; // New: Category field

  Drug({
    required this.id,
    required this.name,
    required this.genericName,
    required this.dosage,
    required this.manufacturer,
    required this.description,
    this.sideEffects = const [],
    required this.category, // New: Category is required
  });
}

// --- Hardcoded Drug Data ---
final List<Drug> dummyDrugs = [
  Drug(
    id: 'D001',
    name: 'Paracetamol 500mg',
    genericName: 'Acetaminophen',
    dosage: '500 mg tablet',
    manufacturer: 'XYZ Pharmaceuticals',
    description: 'Used for relief of pain and fever.',
    sideEffects: ['Nausea', 'Stomach pain', 'Loss of appetite'],
    category: 'Pain Relief',
  ),
  Drug(
    id: 'D002',
    name: 'Amoxicillin 250mg',
    genericName: 'Amoxicillin',
    dosage: '250 mg capsule',
    manufacturer: 'ABC Generics',
    description:
        'An antibiotic used to treat a wide range of bacterial infections.',
    sideEffects: ['Diarrhea', 'Rash', 'Nausea', 'Vomiting'],
    category: 'Antibiotics',
  ),
  Drug(
    id: 'D003',
    name: 'Omeprazole 20mg',
    genericName: 'Omeprazole',
    dosage: '20 mg capsule',
    manufacturer: 'Global Meds',
    description: 'Reduces the amount of acid your stomach makes.',
    sideEffects: ['Headache', 'Nausea', 'Diarrhea', 'Stomach pain'],
    category: 'Gastrointestinal',
  ),
  Drug(
    id: 'D004',
    name: 'Lisinopril 10mg',
    genericName: 'Lisinopril',
    dosage: '10 mg tablet',
    manufacturer: 'HealthCo',
    description: 'Used to treat high blood pressure and heart failure.',
    sideEffects: ['Dizziness', 'Cough', 'Fatigue'],
    category: 'Cardiovascular',
  ),
  Drug(
    id: 'D005',
    name: 'Metformin 500mg',
    genericName: 'Metformin Hydrochloride',
    dosage: '500 mg tablet',
    manufacturer: 'PharmaCorp',
    description: 'Used to treat type 2 diabetes mellitus.',
    sideEffects: ['Nausea', 'Diarrhea', 'Abdominal discomfort'],
    category: 'Diabetes',
  ),
  Drug(
    id: 'D006',
    name: 'Ibuprofen 200mg',
    genericName: 'Ibuprofen',
    dosage: '200 mg tablet',
    manufacturer: 'PainAway Pharma',
    description:
        'Nonsteroidal anti-inflammatory drug (NSAID) used for pain and fever.',
    sideEffects: ['Heartburn', 'Nausea', 'Headache'],
    category: 'Pain Relief',
  ),
  Drug(
    id: 'D007',
    name: 'Vitamin C 1000mg',
    genericName: 'Ascorbic Acid',
    dosage: '1000 mg tablet',
    manufacturer: 'NutriLife',
    description: 'Dietary supplement for immune support.',
    sideEffects: ['Diarrhea', 'Nausea', 'Stomach cramps (high doses)'],
    category: 'Vitamins & Supplements',
  ),
  Drug(
    id: 'D008',
    name: 'Cetirizine 10mg',
    genericName: 'Cetirizine Hydrochloride',
    dosage: '10 mg tablet',
    manufacturer: 'AllergyCare',
    description: 'Antihistamine used to relieve allergy symptoms.',
    sideEffects: ['Drowsiness', 'Dry mouth', 'Fatigue'],
    category: 'Allergy & Cold',
  ),
];

// Get unique categories from dummy data
final List<String> drugCategories =
    dummyDrugs.map((drug) => drug.category).toSet().toList()..sort();

// --- Main Screen with Bottom Navigation ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Current selected tab index

  // List of widgets (screens) for each tab
  static const List<Widget> _widgetOptions = <Widget>[
    DrugListScreen(), // Your existing drug list screen (default)
    CategoryScreen(), // New: Categories Screen
    FavoritesScreen(), // Dedicated Favorites Screen
    ChatScreen(), // New: Chat Screen
    ProfileScreen(), // Dedicated Profile Screen
  ];

  // Titles for each tab
  static const List<String> _appBarTitles = <String>[
    'Pharma Directory',
    'Drug Categories', // New title
    'My Favorites',
    'Pharma Chat', // New title
    'User Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]), // Dynamic AppBar title
        // All other AppBar properties are now inherited from AppBarTheme
      ),
      body: _widgetOptions.elementAt(
        _selectedIndex,
      ), // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Drugs',
          ),
          BottomNavigationBarItem(
            // New: Category tab
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            // New: Chat tab
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex, // Set the current selected index
        selectedItemColor: Colors.teal, // Color for the selected icon/label
        unselectedItemColor: Colors.grey, // Color for unselected icons/labels
        onTap: _onItemTapped, // Callback when a tab is tapped
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
      ),
    );
  }
}

// --- Drug List Screen ---
class DrugListScreen extends StatefulWidget {
  final String? category; // New: Optional category filter

  const DrugListScreen({super.key, this.category});

  @override
  State<DrugListScreen> createState() => _DrugListScreenState();
}

class _DrugListScreenState extends State<DrugListScreen> {
  String _searchQuery = '';
  List<Drug> _filteredDrugs = [];

  @override
  void initState() {
    super.initState();
    _filterDrugs(''); // Initial filter
  }

  @override
  void didUpdateWidget(covariant DrugListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-filter if the category changes
    if (widget.category != oldWidget.category) {
      _filterDrugs(_searchQuery);
    }
  }

  void _filterDrugs(String query) {
    setState(() {
      _searchQuery = query;
      List<Drug> drugsToFilter = dummyDrugs;

      // Apply category filter first if present
      if (widget.category != null) {
        drugsToFilter =
            drugsToFilter
                .where((drug) => drug.category == widget.category)
                .toList();
      }

      // Then apply search query filter
      _filteredDrugs =
          drugsToFilter.where((drug) {
            final nameLower = drug.name.toLowerCase();
            final genericNameLower = drug.genericName.toLowerCase();
            final queryLower = query.toLowerCase();
            return nameLower.contains(queryLower) ||
                genericNameLower.contains(queryLower);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Added Scaffold here
      appBar:
          widget.category !=
                  null // Only show AppBar if a category is filtered
              ? AppBar(
                title: Text('${widget.category} Drugs'),
                // Properties inherited from AppBarTheme
              )
              : null, // No AppBar if it's the main Drugs tab
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterDrugs,
              decoration: InputDecoration(
                labelText: 'Search Drugs',
                hintText:
                    widget.category != null
                        ? 'Search in ${widget.category}...'
                        : 'e.g., Paracetamol, Amoxicillin',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
          Expanded(
            child:
                _filteredDrugs.isEmpty
                    ? Center(
                      child: Text(
                        widget.category != null
                            ? 'No drugs found in "${widget.category}" matching your search.'
                            : 'No drugs found matching your search.',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                    : ListView.builder(
                      itemCount: _filteredDrugs.length,
                      itemBuilder: (context, index) {
                        final drug = _filteredDrugs[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            leading: const Icon(
                              Icons.medical_services,
                              color: Colors.teal,
                            ),
                            title: Text(
                              drug.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              drug.genericName,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DrugDetailScreen(drug: drug),
                                ),
                              );
                            },
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

// --- Category Screen (New) ---
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: drugCategories.length,
      itemBuilder: (context, index) {
        final category = drugCategories[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            // Use InkWell for ripple effect on tap
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DrugListScreen(
                        category: category,
                      ), // Navigate to filtered list
                ),
              );
            },
            borderRadius: BorderRadius.circular(15.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    _getCategoryIcon(category), // Get icon based on category
                    color: Colors.teal,
                    size: 36,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Pain Relief':
        return Icons.medication;
      case 'Antibiotics':
        return Icons.healing;
      case 'Gastrointestinal':
        return Icons.pedal_bike;
      case 'Cardiovascular':
        return Icons.monitor_heart;
      case 'Diabetes':
        return Icons.bloodtype;
      case 'Vitamins & Supplements':
        return Icons.local_pharmacy;
      case 'Allergy & Cold':
        return Icons.sick;
      default:
        return Icons.category;
    }
  }
}

// --- Chat Screen (New) ---
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 80,
              color: Colors.teal.shade300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Pharma Chat!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Connect with a pharmacist or get quick answers to your questions.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chat functionality is under development!'),
                  ),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('Start New Chat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '(This is a placeholder for a real-time chat feature)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// --- Drug Detail Screen ---
class DrugDetailScreen extends StatelessWidget {
  final Drug drug;

  const DrugDetailScreen({super.key, required this.drug});

  void _showPurchaseConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '"${drug.name}" added to your cart! (Simulated purchase)',
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drug.name),
        // All other AppBar properties are now inherited from AppBarTheme
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(
              title: 'Generic Name',
              content: drug.genericName,
              icon: Icons.science,
            ),
            _buildDetailCard(
              title: 'Dosage',
              content: drug.dosage,
              icon: Icons.medical_information,
            ),
            _buildDetailCard(
              title: 'Manufacturer',
              content: drug.manufacturer,
              icon: Icons.factory,
            ),
            _buildDetailCard(
              title: 'Description',
              content: drug.description,
              icon: Icons.description,
            ),
            if (drug.sideEffects.isNotEmpty)
              _buildDetailCard(
                title: 'Side Effects',
                content: drug.sideEffects.join(', '),
                icon: Icons.warning,
                isSideEffect: true,
              ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _showPurchaseConfirmation(
                        context,
                      ); // Directly simulate purchase
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Buy Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 7,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to List'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String content,
    required IconData icon,
    bool isSideEffect = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isSideEffect ? Colors.orange : Colors.teal,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSideEffect ? Colors.orange : Colors.teal,
                  ),
                ),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }
}

// --- Placeholder Favorites Screen ---
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Your favorite drugs will appear here!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Text(
            '(Under Construction)',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// --- Profile Screen (now links to ProfileDetailsScreen) ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.teal,
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome, Pharma User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Manage your profile settings here.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileDetailsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              label: const Text('Edit Profile Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '(More options coming soon!)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// --- New Profile Details Screen ---
class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool _emailNotifications = true;
  bool _smsNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        // All other AppBar properties are now inherited from AppBarTheme
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Divider(color: Colors.teal, thickness: 2),
            _buildInfoTile(Icons.person, 'Name', 'Md Abdullah'),
            _buildInfoTile(Icons.email, 'Email', 'abd.ph@example.com'),
            _buildInfoTile(Icons.phone, 'Phone', '+8823 456 7890'),
            _buildInfoTile(
              Icons.location_on,
              'Address',
              '000 pharmacy road,Khulna',
            ),
            const SizedBox(height: 30),

            const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Divider(color: Colors.teal, thickness: 2),
            SwitchListTile(
              title: const Text('Email Notifications'),
              secondary: const Icon(Icons.email, color: Colors.teal),
              value: _emailNotifications,
              onChanged: (bool value) {
                setState(() {
                  _emailNotifications = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Email notifications ${value ? 'enabled' : 'disabled'}',
                    ),
                  ),
                );
              },
              activeColor: Colors.teal,
            ),
            SwitchListTile(
              title: const Text('SMS Notifications'),
              secondary: const Icon(Icons.sms, color: Colors.teal),
              value: _smsNotifications,
              onChanged: (bool value) {
                setState(() {
                  _smsNotifications = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'SMS notifications ${value ? 'enabled' : 'disabled'}',
                    ),
                  ),
                );
              },
              activeColor: Colors.teal,
            ),
            const SizedBox(height: 30),

            const Text(
              'Privacy Settings',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const Divider(color: Colors.teal, thickness: 2),
            _buildSettingsTile(Icons.lock, 'Change Password', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Change Password functionality not implemented.',
                  ),
                ),
              );
            }),
            _buildSettingsTile(Icons.policy, 'Privacy Policy', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Privacy Policy functionality not implemented.',
                  ),
                ),
              );
            }),
            _buildSettingsTile(Icons.description, 'Terms of Service', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Terms of Service functionality not implemented.',
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 28),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[700])),
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 28),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
