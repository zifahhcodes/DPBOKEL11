import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for analytics...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),

                // Statistics Cards
                Center(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      //_buildStatCard('Total Students', '1281', Colors.blue, 'assets/images/students.svg'),
                      _buildStatCard('Total Teachers', '21', Colors.yellow, 'assets/images/teacher.svg'),
                      _buildStatCard('Total Courses', '4', Colors.green, 'assets/images/courses.svg'),
                      // _buildStatCard('Total Faculties', '12', Colors.red, 'assets/images/faculty.svg'), //removed faculties and students, unrequired for now
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Course Insights Chart
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
                    children: [
                      Text(
                        'Course Insights',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.7,
                              strokeWidth: 10,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                            Text(
                              '73%',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildLegend('Completed', Colors.blue),
                          _buildLegend('In-progress', Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Daily Average Graph
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
                        'Daily Average',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('+30m this week'),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          7,
                          (index) => Column(
                            children: [
                              Container(
                                height: 100,
                                width: 20,
                                color: Colors.blue.shade100,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 50, // Example height for usage
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][index]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  Widget _buildStatCard(String title, String count, Color color, String imagePath) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(count, style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        SizedBox(width: 5),
        Text(label),
      ],
    );
  }

