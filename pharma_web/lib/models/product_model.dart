class Product {
  final String id;
  final String name;
  final String categoryId;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    this.imageUrl =
        'https://www.menap-smi.org/wp-content/uploads/title-banner-The-Role-of-the-Pharmacist-in-Self-Care-and-Self-Medication.jpg',
  });
}
