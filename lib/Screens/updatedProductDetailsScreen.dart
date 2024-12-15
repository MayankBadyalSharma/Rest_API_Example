import 'package:flutter/material.dart';
import 'package:rest_api_example/Models/updatedProductsModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final updatedProduct product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${product.name}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text("Year: ${product.year}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text("Price: \$${product.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text("CPU Model: ${product.cpuModel}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8.0),
            Text("Hard Disk Size: ${product.hardDiskSize} GB", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
