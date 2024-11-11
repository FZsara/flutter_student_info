import 'package:flutter/material.dart';
import 'database.dart';
import 'view.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key, required Map<String, dynamic> student});

  @override
  // ignore: library_private_types_in_public_api
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();

  void saveStudent() async {
    // Save the student data
    await DatabaseHelper.instance.addOrUpdateStudent(
      nameController.text,
      idController.text,
      emailController.text,
      locationController.text,
      instituteController.text,
      departmentController.text,
      cgpaController.text,
    );
    // Navigate to ViewStudentsPage
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const ViewStudentsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Form",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width * 0.9, // Set width dynamically
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: 'ID',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: instituteController,
                    decoration: const InputDecoration(
                      labelText: 'Institute Name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: departmentController,
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: cgpaController,
                    decoration: const InputDecoration(
                      labelText: 'CGPA',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: saveStudent,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text(
                      "Save/Update",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
