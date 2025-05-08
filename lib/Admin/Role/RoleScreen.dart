import 'package:flutter/material.dart';
import 'package:voicefirstuser/Admin/Role/AddRole.dart'; // Your AddRoleDialog
import 'package:voicefirstuser/Admin/Dashboard/home_screen.dart';
import 'package:voicefirstuser/Screens/login_page.dart'; // Your AppDrawer

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  List<Map<String, String>> roles = []; // Store added roles
  List<Map<String, String>> allRoles = []; // full roles
  final TextEditingController _searchController = TextEditingController();

  Future<void> _openAddRoleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) => const AddRoleDialog(),
    );

    if (result != null) {
      setState(() {
        allRoles.add({
          'role': result['role'],
          'locationAccess': result['locationAccess'],
          'issueAccess': result['issueAccess'],
        });
        roles = List.from(allRoles); // update displayed list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Manage Roles'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Role',
            onPressed: _openAddRoleDialog,
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 233, 230, 230),
              ),
              onChanged: (value) {
                setState(() {
                  roles = allRoles.where((role) {
                    final roleName = role['role']?.toLowerCase() ?? '';
                    final searchLower = value.toLowerCase();
                    return roleName.contains(searchLower);
                  }).toList();
                });
              },
            ),
          ),
          Expanded(
            child: roles.isEmpty
                ? const Center(
                    child: Text(
                      'No roles added yet.',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  )
                : ListView.builder(
                    itemCount: roles.length,
                    itemBuilder: (context, index) {
                      final role = roles[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 221, 215, 215),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.person_outline,
                                color: Colors.blue,
                              ),
                            ),
                            title: Text(
                              role['role'] ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location Access: ${role['locationAccess']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Issue Access: ${role['issueAccess']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.black),
                              onPressed: () async {
                                var result = await showDialog(
                                  context: context,
                                  builder: (context) => AddRoleDialog(
                                    initialRole: role['role'],
                                    initialLocationAccess:
                                        role['locationAccess'] == 'Yes',
                                    initialIssueAccess:
                                        role['issueAccess'] == 'Yes',
                                  ),
                                );

                                if (result != null) {
                                  setState(() {
                                    allRoles[index] = {
                                      'role': result['role'],
                                      'locationAccess':
                                          result['locationAccess'],
                                      'issueAccess': result['issueAccess'],
                                    };
                                    roles = List.from(
                                        allRoles); // refresh the displayed list
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
