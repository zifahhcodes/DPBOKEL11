import 'package:flutter/material.dart';
import 'pages/dashboard_screen.dart';
import 'pages/home_screen.dart';
// import 'pages/messaging.dart';
import 'pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(), // Default route to Dashboard
        '/home': (context) => HomeScreen(),  // Route to HomeScreen
        // '/messages': (context) => Messaging(),  // unrequired
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

//changed the navbar into 3 navbars
// changed the homescreen design for teacher pov
// changed the dashboard design to only teachers and courses