class  updatedProduct {
  final String name;
  final int year;
  final double price;
  final String cpuModel;
  final int hardDiskSize;

  updatedProduct({
    required this.name,
    required this.year,
    required this.price,
    required this.cpuModel,
    required this.hardDiskSize,
  });

  // Factory method to create a Product from JSON
  factory updatedProduct.fromJson(Map<String, dynamic> json) {
    return updatedProduct(
      name: json['name'],
      year: json['year'],
      price: json['price'],
      cpuModel: json['cpu_model'],
      hardDiskSize: json['hard_disk_size'],
    );
  }
}
