import 'package:flutter/material.dart';
import 'package:voicefirstuser/Admin/Employee/EmployeeScreen.dart';
import 'package:voicefirstuser/Admin/Role/RoleScreen.dart'; // Make sure RoleScreen is imported

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Your table/data view goes here'),
            ),
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF12192C), // Dark blue background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Center(
                child: Image.asset(
                  'assets/SplashScreenImage/splash2.png', // Logo path
                  height: 40,
                ),
              ),
            ),
            _buildDrawerItem(Icons.dashboard, 'Dashboard', context),
            _buildDrawerItem(Icons.settings, 'Roles', context, isRole: true),
            _buildDrawerItem(Icons.info, 'Demo', context),
            _buildDrawerItem(
              Icons.supervised_user_circle_sharp,
              'Employee',
              context,
              isEmployee: true, // <-- set this to TRUE, not false
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    BuildContext context, {
    bool selected = false,
    bool isRole = false,
    bool isEmployee = false,
  }) {
    return Container(
      color: selected ? Colors.yellow.shade700 : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.pop(context); // Close the drawer first
          if (isRole) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoleScreen()),
            );
          } else if (isEmployee) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Employeescreen()),
            );
          }
        },
      ),
    );
  }
}
