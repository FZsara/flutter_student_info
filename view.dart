import 'package:flutter/material.dart';
import 'database.dart';
import 'add.dart';

class ViewStudentsPage extends StatefulWidget {
  const ViewStudentsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewStudentsPageState createState() => _ViewStudentsPageState();
}

class _ViewStudentsPageState extends State<ViewStudentsPage> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  void loadStudents() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() {
      students = data;
    });
  }

  void confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                DatabaseHelper.instance.deleteStudent(id);
                loadStudents();
                Navigator.pop(context);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  void goToUpdatePage(Map<String, dynamic> student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudentPage(
          student: student, // Pass the student data for updating
        ),
      ),
    ).then((_) {
      loadStudents(); // Reload the students list when coming back
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Students",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text("${student['name']} (${student['id']})"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => confirmDelete(student['id']),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Student Details"),
                  content: Text(
                    "Name: ${student['name']}\n"
                    "ID: ${student['id']}\n"
                    "Email: ${student['email']}\n"
                    "Location: ${student['location']}\n"
                    "Institute: ${student['institute']}\n"
                    "Department: ${student['department']}\n"
                    "CGPA: ${student['cgpa']}",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => goToUpdatePage(student),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
