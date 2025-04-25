// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:voicefirstuser/Screens/login_page.dart';


// class WelcomeScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   Color _loginTextColor = Colors.black; // Default color for "Log In"

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.yellow.shade200, Colors.white], // Yellow Gradient
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Title
//             Text(
//               "Let's get started!",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 90, 89, 89),
//               ),
//             ),
//             SizedBox(height: 20),

//             // Enlarged Circular Image
//             Container(
//               width: 250,
//               height: 250,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image.asset(
//                   'assets/WelcomePage/welcomePage.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),

//             // Sign Up Button
//             ElevatedButton(
//               onPressed: () {
//                 print("Sign Up Pressed");
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 "Sign Up",
//                 style: TextStyle(fontSize: 18, color: Colors.yellow),
//               ),
//             ),
//             SizedBox(height: 20),

//             // "Already have an account?" + Clickable "Log In"
//             RichText(
//               text: TextSpan(
//                 text: "Already have an account? ",
//                 style: TextStyle(color: Colors.black, fontSize: 14),
//                 children: [
//                   TextSpan(
//                     text: "Log In",
//                     style: TextStyle(
//                       color: _loginTextColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         setState(() {
//                           _loginTextColor = Colors.yellow; // Change color on tap
//                         });
//                         Future.delayed(Duration(milliseconds: 200), () {
//                           setState(() {
//                             _loginTextColor = Colors.black; // Reset color
//                           });
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => LoginScreen()),
//                           );
//                         });
//                       },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
