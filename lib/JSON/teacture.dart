import 'dart:convert';

Teacher teachersFromMap(String str) => Teacher.fromMap(json.decode(str));

String teachersToMap(Teacher data) => json.encode(data.toMap());

class Teacher {
  final int? tcrId;
  final String? fullName;
  final String? email;
  final String tcrName;
  final String lecture;
  final String password;

  Teacher({
    this.tcrId,
    this.fullName,
    this.email,
    required this.tcrName,
    required this.lecture,
    required this.password,
  });

  //These json value must be same as your column name in database that we have already defined
  //one column didn't match
  factory Teacher.fromMap(Map<String, dynamic> json) => Teacher(
    tcrId: json["tcrId"],
    fullName: json["fullName"],
    email: json["email"],
    tcrName: json["tcrName"],
    lecture: json["lecture"],
    password: json["tcrPassword"],
  );

  Map<String, dynamic> toMap() => {
    "tcrId": tcrId,
    "fullName": fullName,
    "email": email,
    "tcrName": tcrName,
    "lecture": lecture,
    "tcrPassword": password,
  };  
}
