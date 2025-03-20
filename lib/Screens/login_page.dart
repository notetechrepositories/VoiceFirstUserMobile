// import 'package:flutter/material.dart';
// import 'package:voicefirstuser/Screens/splash_screen.dart';

// class OnboardingPage extends StatefulWidget {
//   @override
//   _OnboardingPageState createState() => _OnboardingPageState();
// }

// class _OnboardingPageState extends State<OnboardingPage> {
//   final PageController _controller = PageController();
//   int _currentIndex = 0;

//   final List<Map<String, String>> _onboardingData = [
//     {
//       'title': 'Welcome to the Demo app',
//       'subtitle': 'Connect and chat effortlessly with Chat Connect!',
//     },
//     {
//       'title': 'Share your Contacts only',
//       'subtitle': 'Connect and chat effortlessly with Chat Connect!',
//     },
//     {
//       'title': 'What happens Here stays here',
//       'subtitle': 'Connect and chat effortlessly with Chat Connect!',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _controller,
//               onPageChanged: (index) => setState(() => _currentIndex = index),
//               itemCount: _onboardingData.length,
//               itemBuilder: (context, index) {
//                 return OnboardingContent(
//                   title: _onboardingData[index]['title']!,
//                   subtitle: _onboardingData[index]['subtitle']!,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingContent extends StatelessWidget {
//   final String title;
//   final String subtitle;

//   OnboardingContent({required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Spacer(),
//         Expanded(
//           flex: 2,
//           child: Image.asset(
//             'assets/OnBoardingImage/4.png',
//           ), // Replace with your own image
//         ),
//         Spacer(),
//         Stack(
//           children: [
//             ClipPath(
//               clipper: BottomArcClipper(),
//               child: Container(
//                 width: double.infinity,
//                 height: 300, // Increased height to cover buttons
//                 color: Colors.black,
//               ),
//             ),
//             Positioned.fill(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20), // Adjust spacing
//                   Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 30),
//                     child: Text(
//                       subtitle,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.grey.shade400),
//                     ),
//                   ),
//                   SizedBox(height: 70), // Space for buttons
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         child: Text(
//                           'Skip',
//                           style: TextStyle(
//                             color: Colors.white, // Now visible on black
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => SplashScreen()),
//                           );
//                         },
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white, // Button is white
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(14),
//                         ),
//                         child: Icon(Icons.arrow_forward,
//                             color: Colors.black), // Black arrow
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => SplashScreen()),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Custom clipper for arc at the BOTTOM covering full section
// class BottomArcClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, 50); // Move the start point down
//     path.quadraticBezierTo(
//         size.width / 2, -50, size.width, 50); // Create the arc
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
