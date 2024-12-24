import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../JSON/teacture.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'teacher_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Teacher(
        tcrId INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT,
        email TEXT,
        tcrName TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  // Insert a teacher into the database
  Future<int> insertTeacher(Teacher teacher) async {
    final db = await database;
    return await db.insert(
      'Teacher',
      teacher.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all teachers from the database
  Future<List<Teacher>> fetchAllTeachers() async {
    final db = await database;
    final result = await db.query('Teacher');

    return result.map((json) => Teacher.fromMap(json)).toList();
  }

  // Fetch a teacher by tcrName and password for authentication
  Future<bool> authenticate(Teacher teacher) async {
    final db = await database;
    try {
      final result = await db.query(
        'Teacher',
        where: 'tcrName = ? AND password = ?',
        whereArgs: [teacher.tcrName, teacher.password],
      );
      return result.isNotEmpty;
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }

  // Update a teacher in the database
  Future<int> updateTeacher(Teacher teacher) async {
    final db = await database;
    return await db.update(
      'Teacher',
      teacher.toMap(),
      where: 'tcrId = ?',
      whereArgs: [teacher.tcrId],
    );
  }

  // Delete a teacher from the database
  Future<int> deleteTeacher(int id) async {
    final db = await database;
    return await db.delete(
      'Teacher',
      where: 'tcrId = ?',
      whereArgs: [id],
    );
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('tcrName'); // Clear the stored session data
  }

  // Close the database
  Future<void> closeDatabase() async {
    final db = await _database;
    if (db != null) {
      await db.close();
    }
  }
}