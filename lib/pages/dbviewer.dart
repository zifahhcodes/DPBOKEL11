import 'package:flutter/material.dart';
import 'package:edusync/database/database_helper.dart';
import 'package:edusync/JSON/teacture.dart';
import 'register.dart'; // Assuming you already have a register page.

class DatabaseViewer extends StatefulWidget {
  const DatabaseViewer({Key? key}) : super(key: key);

  @override
  State<DatabaseViewer> createState() => _DatabaseViewerState();
}

class _DatabaseViewerState extends State<DatabaseViewer> {
  late Future<List<Teacher>> teachersFuture;

  @override
  void initState() {
    super.initState();
    teachersFuture = _fetchTeachers();
  }

  Future<List<Teacher>> _fetchTeachers() async {
    final dbHelper = DatabaseHelper();
    try {
      final teachersData = await dbHelper.fetchAllTeachers();
      return teachersData; // fetchAllTeachers already returns a List<Teacher>
    } catch (e) {
      print('Error fetching teachers: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Viewer'),
      ),
      body: FutureBuilder<List<Teacher>>(
        future: teachersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found.'));
          } else {
            final teachers = snapshot.data!;
            return ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final teacher = teachers[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      (teacher.fullName?.isNotEmpty ?? false)
                          ? teacher.fullName![0].toUpperCase()
                          : '?', // Fallback to '?' if fullName is null or empty
                    ),
                  ),
                  title: Text(teacher.fullName ?? 'Unknown Name'), // Fallback to 'Unknown Name'
                  subtitle: Text(teacher.email ?? 'No Email'), // Fallback to 'No Email'
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      final dbHelper = DatabaseHelper();
                      await dbHelper.deleteTeacher(teacher.tcrId!); // Ensure tcrId is non-null
                      setState(() {
                        teachersFuture = _fetchTeachers(); // Refresh the data
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the Register page
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );

          if (result != null && result is Teacher) {
            // If registration was successful, update the list
            setState(() {
              teachersFuture = _fetchTeachers();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}