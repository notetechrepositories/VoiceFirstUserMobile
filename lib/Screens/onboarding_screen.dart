import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:voicefirstuser/Screens/login_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.black,
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
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
      onSkip: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
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
      titleWidget: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 4,
            width: 50,
            color: Colors.yellow,
          ),
        ],
      ),
      bodyWidget: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
      image: Center(
        child: Image.asset(imagePath, height: 350),
      ),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.only(top: 20),
        titlePadding: EdgeInsets.only(top: 30),
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
 