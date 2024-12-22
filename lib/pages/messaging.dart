// import 'package:flutter/material.dart';

// class Messaging extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         leading: Icon(Icons.arrow_back, color: Colors.black),
//         title: Row(
//           children: [
//             Image.asset('assets/images/edusynclogo.png', height: 100),
//             SizedBox(width: 10),
//             Text(
//               'EDUSYNC',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           Icon(Icons.signal_cellular_alt, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.wifi, color: Colors.black),
//           SizedBox(width: 10),
//           Icon(Icons.battery_full, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search for Contacts",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//               SizedBox(height: 16),
//               // List of Decorated Boxes
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: Container(
//                         width: double.infinity, 
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 4,
//                               offset: Offset(2, 2),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Text
//                               Expanded(
//                                 child: Text(
//                                   "Kontak Nomor ${index + 1}",
//                                   style: TextStyle(color: Colors.black, fontSize: 16),
//                                 ),
//                               ),
//                               // Call Icon
//                               Icon(Icons.call, color: Colors.green, size: 24),
//                               // Video Call Icon
//                               SizedBox(width: 10),
//                               Icon(Icons.videocam, color: Colors.green, size: 24),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
      
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart), label: 'Dashboard'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: 'Cart'),
//           BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//         ],
//         currentIndex: 3,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.pushNamed(context, '/home'); 
//           } else if (index == 1) {
//             Navigator.pushNamed(context, '/'); 
//           } else if (index == 3) {
//             Navigator.pushNamed(context, '/messages');
//             } else if (index == 4) {
//             Navigator.pushNamed(context, '/profile');
//           }
//         },
//       ),
//     );
//   }
// }

// we don't need the messaging navbar as of now.