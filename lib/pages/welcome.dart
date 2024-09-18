import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
            SizedBox(height: 20),

           
            Text(
              'Welcome ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),

           
            SizedBox(height: 10),

          
            Text(
              'voitures',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),

            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
