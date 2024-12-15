import 'dart:convert';
import 'package:http/http.dart' as http;
import'package:rest_api_example/Models/product.dart';
import 'package:flutter/material.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://api.restful-api.dev/objects'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<Product> fetchProductById(int id) async {
  final url = Uri.parse("https://api.restful-api.dev/objects/$id");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}


Future<List<Product>> fetchProductssingleobject() async {
  final response = await http.get(Uri.parse('https://api.restful-api.dev/objects/7'));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);

    if (jsonData is List) {
      // JSON is a list of products
      return jsonData.map((item) => Product.fromJson(item as Map<String, dynamic>)).toList();
    } else if (jsonData is Map) {
      // JSON is a single product
      return [Product.fromJson(jsonData as Map<String, dynamic>)];
    } else {
      throw Exception('Unexpected JSON format');
    }
  } else {
    throw Exception('Failed to load products');
  }
}









