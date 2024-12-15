import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_example/Screens/newScreen.dart';
import 'package:rest_api_example/Screens/product_list.dart';
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cpuModelController = TextEditingController();
  final TextEditingController hardDiskSizeController = TextEditingController();


  Future<void> handleSubmit() async {
    String name = nameController.text;
    String year = yearController.text;
    String price = priceController.text;
    String cpuModel = cpuModelController.text;
    String hardDiskSize = hardDiskSizeController.text;

    // API endpoint URL
    String url = "https://api.restful-api.dev/objects";

    // Creating a data map to send in the POST request
    Map<String, dynamic> data = {
      "name": name,
      "year": year,
      "price": price,
      "cpu_model": cpuModel,
      "hard_disk_size": hardDiskSize,
    };

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print("Data submitted successfully");

      /*  // Clear the text fields after submission
        nameController.clear();
        yearController.clear();
        priceController.clear();
        cpuModelController.clear();
        hardDiskSizeController.clear();*/

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data submitted successfully')),
        );
      } else {
        print("Failed to submit data: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit data')),
        );
      }
    } catch (e) {
      print("Error occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
  }

  void updatedContents(){
Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => NewScreen())
);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: yearController,
              decoration: InputDecoration(
                labelText: 'Year',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: cpuModelController,
              decoration: InputDecoration(
                labelText: 'CPU Model',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: hardDiskSizeController,
              decoration: InputDecoration(
                labelText: 'Hard Disk Size',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onLongPress: updatedContents ,
                onPressed: handleSubmit,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}