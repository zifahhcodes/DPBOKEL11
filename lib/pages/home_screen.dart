import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'register.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? tcrName; // Variabel untuk menyimpan nama pengguna

  @override
  void initState() {
    super.initState();
    checkSession(); // Cek session saat aplikasi dimulai
  }

  Future<void> checkSession() async {
    // Cek SharedPreferences untuk mendapatkan tcrName (nama pengguna)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('tcrName'); // Ambil tcrName dari shared preferences
    setState(() {
      tcrName = name; // Update state dengan nama pengguna atau null jika belum ada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
                child: tcrName == null
                    ? Column(
                        children: [
                          Center(
                            child: Text(
                              'Login/Register to access full features.',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 64, 103, 194)),
                                ),
                                child: Text('Login', style: TextStyle(color: Colors.white),),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green.shade500),
                                ),
                                child: Text('Register', style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/profile_picture.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello, $tcrName!',
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
                          SizedBox(height: 20),
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
                              _buildSubjectButton(
                                  context,
                                  'Teaching Highschool \nMathematics',
                                  'assets/images/math.svg',
                                  Colors.blue),
                              _buildSubjectButton(
                                  context,
                                  'Teaching Highschool Biology',
                                  'assets/images/biology.svg',
                                  Colors.green),
                              _buildSubjectButton(
                                  context,
                                  'Curriculum Planning',
                                  'assets/images/geography.svg',
                                  Colors.orange),
                              _buildSubjectButton(
                                  context,
                                  'Educational Management',
                                  'assets/images/history.svg',
                                  Colors.red),
                              _buildSubjectButton(
                                  context,
                                  'Learning Strategies',
                                  'assets/images/english.svg',
                                  Colors.yellow),
                              _buildSubjectButton(
                                  context,
                                  'See others...',
                                  'assets/images/others.png',
                                  Colors.black),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 20),
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
        // Navigate directly to SubjectDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubjectDetailScreen(title: title),
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
  final String title;

  SubjectDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title Details',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}