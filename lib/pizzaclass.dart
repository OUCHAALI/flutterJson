class Pizza {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String components;

  Pizza({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.components,
  });

  // Factory method to create Pizza from a Map
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      components: json['components'],
    );
  }
}
