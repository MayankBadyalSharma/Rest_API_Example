import 'package:flutter/material.dart';
import 'package:rest_api_example/Models/product.dart';
import 'package:rest_api_example/Controller/productController.dart';
import 'package:rest_api_example/Screens/updateScreen.dart';
import 'package:rest_api_example/Screens/product_listScreen.dart';
class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
    
  }

void updatePage(){
Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const UpdateScreen())
);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'),
      actions: [
FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: updatePage )
      ],
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                
                ListTile(
  title: Text(product.name),
  subtitle: Text('ID: ${product.id}'),
  trailing: product.data != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Color: ${product.data!['color'] ?? 'N/A'}'),
            Text('Capacity: ${product.data!['capacity'] ?? product.data!['capacity GB'] ?? 'N/A'} GB'),
            Text('Year: ${product.data!['year'] ?? 'N/A'}'),
          ],
        )
      : Text('No data'),
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(productId: product.id.),
      ),
    );
  },
);
              },
            );
          }
        },
      ),
    );
  }
}
