import 'package:flutter/material.dart';
import 'package:voicefirstuser/Screens/saved_page.dart';
import 'package:voicefirstuser/User/Dashboard/Profile.dart';
import 'package:voicefirstuser/User/Dashboard/QrScanner.dart';

import 'package:voicefirstuser/User/Dashboard/UserHomeScreen.dart';

// import other screens like SavedScreen, ScanScreen if you have them
class Bottomnavbar extends StatefulWidget {
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Userhomescreen(), // This might be missing or commented
    SavedScreen(),
    QrScanScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Color(0xFFFCC737),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Color(0xFFFCC737)),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
