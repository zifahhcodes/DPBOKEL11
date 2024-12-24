import 'dart:convert';
import 'package:equatable/equatable.dart';

Teacher teachersFromMap(String str) => Teacher.fromMap(json.decode(str));

String teachersToMap(Teacher data) => json.encode(data.toMap());

Lecture lectureFromMap(String str) => Lecture.fromMap(json.decode(str));

String lectureToMap(Lecture data) => json.encode(data.toMap());


class Teacher {
  final int? tcrId; // Nullable for new records
  final String? fullName; // Nullable
  final String? email; // Nullable
  final String tcrName;
  final String password;

  Teacher({
    this.tcrId,
    this.fullName,
    this.email,
    required this.tcrName,
    required this.password,
  });

  // Convert a Teacher object into a Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'tcrId': tcrId,
      'fullName': fullName,
      'email': email,
      'tcrName': tcrName,
      'password': password,
    };
  }

  // Create a Teacher object from a Map (database result)
  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      tcrId: map['tcrId'] as int?,
      fullName: map['fullName'] as String?,
      email: map['email'] as String?,
      tcrName: map['tcrName'] as String,
      password: map['password'] as String,
    );
  }
}


class Lecture {
  final int? lctId;
  final String lctName;
  final int tcrId;

  Lecture({
    this.lctId,
    required this.lctName,
    required this.tcrId,
  });

  // Factory constructor to create a Lecture object from a Map (e.g., a database row)
  factory Lecture.fromMap(Map<String, dynamic> json) => Lecture(
        lctId: json["lctId"],
        lctName: json["lctName"],
        tcrId: json["tcrId"],
      );

  // Method to convert a Lecture object into a Map (e.g., for inserting into the database)
  Map<String, dynamic> toMap() => {
        "lctId": lctId,
        "lctName": lctName,
        "tcrId": tcrId,
      };
}