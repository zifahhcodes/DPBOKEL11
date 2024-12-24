import 'package:edusync/main.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import '../database/database_helper.dart';
import 'package:edusync/JSON/teacture.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          '9:41 PM',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(Icons.signal_cellular_alt, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/edusynclogo.png'), 
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EDUSYNC',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'edusync@gmail.com',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.edit, color: Colors.black),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward, color: Colors.black), // Panah untuk Edit Profile
                  onTap: () {},
                ),
                 ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward, color: Colors.black), // Panah untuk Settings
                  onTap: () {},
                 ),
               ListTile(
                  leading: Icon(Icons.history, color: Colors.black),
                  title: Text('History'),
                  trailing: Icon(Icons.arrow_forward, color: Colors.black), // Panah untuk History
                  onTap: () {},
                ),
               ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                          'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                  onTap: () async {
                    final dbHelper = DatabaseHelper(); 
                    await dbHelper.logout(); // Wait for logout to complete
                    
                    // Navigate to LoginPage after clearing the session
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}