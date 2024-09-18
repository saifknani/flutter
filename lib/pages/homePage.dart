
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/addproduit.dart';
import 'package:flutter_application_1/pages/listproduit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductScreen()),
                );
              },
              child: Text('Add Product'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListProduit()),
                );
              },
              child: Text('List Products'),
            ),
          ],
        ),
      ),
    );
  }
}
