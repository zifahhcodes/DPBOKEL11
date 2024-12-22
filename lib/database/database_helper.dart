import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../JSON/teacture.dart';

class DatabaseHelper {
  final databaseName = "auth.db";

  // Tables
  String teacher = '''
   CREATE TABLE Teacher (
   tcrId INTEGER PRIMARY KEY AUTOINCREMENT,
   fullName TEXT,
   email TEXT,
   lecture TEXT,
   password TEXT
   )
   ''';

  // Our connection is ready
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(teacher);
    });
  }

  // Function methods for Teacher

  // Authentication
  Future<bool> authenticate(Teacher tcr) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from Teacher where tcrName = '${tcr.tcrName}' AND password = '${tcr.password}' ");
    return result.isNotEmpty;
  }

  // Sign up
  Future<int> createUser(Teacher tcr) async {
    final Database db = await initDB();
    return db.insert("Teacher", tcr.toMap());
  }

  // Get current User details
  Future<Teacher?> getUser(String tcrName, String password) async {
    final Database db = await initDB();
    var result = await db.query(
      "Teacher",
      where: "tcrName = ? AND password = ?",
      whereArgs: [tcrName, password],
    );

    if (result.isNotEmpty) {
      return Teacher.fromMap(result.first); // Return the user details
    }
    return null;
  }

  // Function methods for jobs

  // Insert a job into the jobs table
  Future<void> insertJob(Map<String, dynamic> job) async {
    final Database db = await initDB();
    await db.insert('jobs', job, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Retrieve all jobs from the jobs table
  Future<List<Map<String, dynamic>>> getJobs() async {
    final Database db = await initDB();
    return db.query('jobs');
  }

  Future<void> clearAllTables() async {
    final Database db = await initDB();

    // Delete all records from the Teacher table
    await db.delete('Teacher');

    // Delete all records from the jobs table
    await db.delete('jobs');
  }
}
