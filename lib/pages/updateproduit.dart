// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UpdateProductScreen extends StatefulWidget {
  final String productId;

  UpdateProductScreen({required this.productId});

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch product details when the screen is initialized
    fetchProductDetails();
  }

Future<void> fetchProductDetails() async {
  try {
    final response = await http.put(
      Uri.parse('http://localhost:3000/products/${widget.productId}'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _nameController.text = jsonData['data']['name'] ?? '';
        _descriptionController.text = jsonData['data']['description'] ?? '';
        _quantityController.text = jsonData['data']['qte'] ?? '';
        _priceController.text = jsonData['data']['price'] ?? '';
      });
    } else {
      print('Error loading product details: ${response.statusCode}');
      print(widget.productId);
      print(response.body);
    }
  } catch (e) {
    print('Network error: ');
    print(widget.productId);
    
  }
}


  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Map<String, String> formData = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        'qte': _quantityController.text,
        'price': _priceController.text,
      };

      try {
        final response = await http.put(
          Uri.parse('http://localhost:3000/products/${widget.productId}'),
          body: formData,
        );

        if (response.statusCode == 201) {
         
          print('Product updated successfully');
        } else {
          
          print('Error updating the product: ${response.statusCode}');
          print(response.body);
        }
      } catch (e) {
        
        print('Network error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le produit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantité'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la quantité';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Prix'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Mettre à jour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
