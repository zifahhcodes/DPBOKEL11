
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Row(
          children: [
            Image.asset('assets/images/edusynclogo.png', height: 100),
            SizedBox(width: 10),
            Text(
              'EDUSYNC',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Icon(Icons.signal_cellular_alt, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.wifi, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for Courses...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20),

              // Module Screen Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Hafizh!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Level 3',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.6,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Grade Section
              Text(
                'Student - Grade 12',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),

              // Available Subjects Section
              Text(
                'Available Subjects',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildSubjectButton(context, 'Mathematics',
                      'assets/images/math.svg', Colors.blue),
                  _buildSubjectButton(context, 'Biology',
                      'assets/images/biology.svg', Colors.green),
                  _buildSubjectButton(context, 'Geography',
                      'assets/images/geography.svg', Colors.orange),
                  _buildSubjectButton(context, 'History',
                      'assets/images/history.svg', Colors.red),
                  _buildSubjectButton(context, 'English',
                      'assets/images/english.svg', Colors.yellow),
                  _buildSubjectButton(context, 'See others...',
                      'assets/images/others.png', Colors.grey),
                ],
              ),
              SizedBox(height: 20),

              // Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    icon: Icon(Icons.bar_chart, color: Colors.white),
                    label: Text(
                      'Learning Reports',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    icon: Icon(Icons.schedule, color: Colors.white),
                    label: Text(
                      'AI-Personalized Schedule',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Current page
          } else if (index == 1) {
            Navigator.pushNamed(context, '/'); // Dashboard page
          } else if (index == 3) {
            Navigator.pushNamed(context, '/messages');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildSubjectButton(BuildContext context, String title,
      String imagePath, Color backgroundColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubjectDetailScreen(subjectName: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath, height: 50, width: 50),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectDetailScreen extends StatelessWidget {
  final String subjectName;

  SubjectDetailScreen({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: Center(
        child: Text(
          '$subjectName Details',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
