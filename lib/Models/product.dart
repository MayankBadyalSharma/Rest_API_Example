class Product {
  final String id;
  final String name;
  final Map<String, dynamic>? data;

  Product({
    required this.id,
    required this.name,
    this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': data?['color'] ?? 'N/A',
      'capacity': data?['capacity'] ?? data?['capacity GB'] ?? 'N/A',
    };
  }
}
