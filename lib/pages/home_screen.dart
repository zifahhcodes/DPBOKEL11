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
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.png'),
                    ),
                    SizedBox(width: 10), // Add spacing between the image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, teacher_name!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'What would you like to learn today?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          LinearProgressIndicator(
                            value: 0.6,
                            backgroundColor: Colors.grey.shade200,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Grade Section
              Text(
                'Teacher - Kurikulum Merdeka',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),

              // Available Subjects Section
              Text(
                'Available Courses',
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
                  _buildSubjectButton(context, 'Teaching Highschool \nMathematics',
                      'assets/images/math.svg', Colors.blue),
                  _buildSubjectButton(context, 'Teaching Highschool Biology',
                      'assets/images/biology.svg', Colors.green),
                  _buildSubjectButton(context, 'Curriculum Planning',
                      'assets/images/geography.svg', Colors.orange),
                  _buildSubjectButton(context, 'Educational Management',
                      'assets/images/history.svg', Colors.red),
                  _buildSubjectButton(context, 'learning Strategies',
                      'assets/images/english.svg', Colors.yellow),
                  _buildSubjectButton(context, 'See others...',
                      'assets/images/others.png', Colors.black),
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
            SvgPicture.asset(imagePath, height: 150, width: 150),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
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
