/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rest_api_example/Controller/productController.dart';

import 'package:rest_api_example/Models/product.dart';
import 'package:rest_api_example/Screens/updatedProductDetailsScreen.dart'; 

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // List to hold the fetched products
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products when the screen initializes
  }

  // Function to fetch products from the API
  Future<void> fetchProducts() async {
    String url = "https://api.restful-api.dev/objects/7";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          products = data.map((json) => Product.fromJson(json)).toList();
        });
      } else {
        print("Failed to load products: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load products')),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred while fetching products')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while data is loading
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                      'Year: ${product.year}, Price: \$${product.price.toStringAsFixed(2)}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ProductDetailScreen(product: )
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
*/