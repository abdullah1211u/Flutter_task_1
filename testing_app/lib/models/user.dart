class User {
  final String id;
  final String name;
  final String email;
  final List<String> favoriteProductIds;

  // FIX: Changed the constructor to ensure the favorites list is modifiable.
  User({
    required this.id,
    required this.name,
    required this.email,
    List<String>? favoriteProductIds,
  }) : favoriteProductIds = favoriteProductIds ?? [];
}
