class Package {
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  Package({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'] as String,
      price: json['price'] as int,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );
  }
}
