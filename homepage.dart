import 'package:flutter/material.dart';
import 'add.dart';
import 'view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Student Management Logo
            Image.asset(
              'asset/image/logo.png',
              height: 200, // Adjust height as needed
              width: 200,  // Adjust width as needed
            ),
            const SizedBox(height: 40), // Spacing between logo and buttons
            
            // Add Students Button
            ElevatedButton.icon(
              icon: const Icon(Icons.add, color: Colors.black),
              label: const Text("Add Students", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddStudentPage(student: {},)));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
            
            const SizedBox(height: 20), // Spacing between buttons
            
            // View Students Button
            ElevatedButton.icon(
              icon: const Icon(Icons.view_list, color: Colors.black),
              label: const Text("View Students", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewStudentsPage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
