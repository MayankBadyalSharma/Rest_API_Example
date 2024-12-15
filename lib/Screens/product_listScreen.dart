import 'package:flutter/material.dart';
import 'package:rest_api_example/Models/product.dart';
import 'package:rest_api_example/Controller/productController.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: FutureBuilder<Product>(
        future: fetchProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product ID: ${product.id}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Name: ${product.name}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Color: ${product.data?['color'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Capacity: ${product.data?['capacity'] ?? product.data?['capacity GB'] ?? 'N/A'} GB', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Year: ${product.data?['year'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
