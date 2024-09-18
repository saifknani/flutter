

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Product.dart';
import 'package:flutter_application_1/pages/updateproduit.dart';
import 'package:http/http.dart' as http;


class ListProduit extends StatefulWidget {
  @override
  _ListProduitState createState() => _ListProduitState();
}

class _ListProduitState extends State<ListProduit> {
  List<ProduitModel> produits = [];

 Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/products'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      print('Received data: ${response.body}'); 

      setState(() {
        produits = List<ProduitModel>.from(
          jsonData['data'].map((product) => ProduitModel.fromJson(product)),
        );
      });
    } else {
      print('Error loading products: ${response.statusCode}');
    }
  } catch (e) {
    print('Network error: $e');
  }
}

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          ProduitModel produit = produits[index];

          return ListTile(
            title: Text(produit.name),
            subtitle: Text(produit.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    
                    setState(() {
                      produits.removeAt(index);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProductScreen(productId: produit.id),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
