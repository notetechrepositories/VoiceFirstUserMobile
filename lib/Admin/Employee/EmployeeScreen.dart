import 'package:flutter/material.dart';
import 'package:voicefirstuser/Admin/Dashboard/home_screen.dart';
import 'package:voicefirstuser/Screens/login_page.dart';

class Employeescreen extends StatelessWidget {
  const Employeescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text('Employee List'),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add Employee',
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              },
            ),
          ],
        ));
  }
}
