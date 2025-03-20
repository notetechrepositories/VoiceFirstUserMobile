import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:voicefirstuser/Screens/login_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        _buildPage(
          "Voice First",
          "Smart, Real-Time Issue Reporting & Resolution powered by Notetech Software",
          "assets/OnBoardingImage/1.png",
        ),
        _buildPage(
          "AI-Powered Insights",
          "Leverage artificial intelligence to uncover actionable insights.",
          "assets/OnBoardingImage/2.png",
        ),
        _buildPage(
          "Automated Reports",
          "Generate reports automatically for data-driven decision making.",
          "assets/OnBoardingImage/3.png",
        ),
        _buildPage(
          "Real-Time Alerts & Escalations",
          "Notify the right personnel instantly for quick action and escalation.",
          "assets/OnBoardingImage/4.png",
        ),
      ],
      onDone: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
      onSkip: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
      showSkipButton: true,
      skip: Text("Skip", style: TextStyle(color: Colors.white, fontSize: 18)),
      next: Icon(Icons.arrow_forward, color: Colors.white),
      done: Text("Done",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.yellow,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  PageViewModel _buildPage(String title, String body, String imagePath) {
    return PageViewModel(
      titleWidget: SizedBox(
        height: 50,
      ), // Removed title from top
      bodyWidget: Stack(
        children: [
          ClipPath(
            clipper: TopArcClipper(),
            child: Container(
              width: double.infinity,
              height: 300, // Adjusted height for title & subtitle inside arc
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(height: 4, width: 50, color: Colors.yellow),
                  SizedBox(height: 12),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      image: Center(
        child: Image.asset(imagePath, height: 300),
      ),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.only(top: 20),
        titlePadding: EdgeInsets.only(top: 10),
        bodyAlignment: Alignment.center,
        boxDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade200, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

// Custom clipper for arc at the TOP
class TopArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 50); // Move the start point down
    path.quadraticBezierTo(
        size.width / 2, -50, size.width, 50); // Create the arc
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
