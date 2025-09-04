import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 Main content like Instagram Settings
      body: ListView(
        children: [
          _buildSettingsItem("Professors, Faculty and Staffs Information", Icons.person, const PFSInfoPage()),
          _buildSettingsItem("Room and Offices Information", Icons.manage_accounts, const ROInfoPage()),

        ],
      ),

      // 🔹 Floating Action Button (Camera)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add camera functionality
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 🔹 Bottom Navigation Bar with notch
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.black),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48), // space for FAB
            IconButton(
              icon: const Icon(Icons.article, color: Colors.black),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.black),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Instagram-style settings row
  Widget _buildSettingsItem(String text, IconData icon, Widget page) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
        const Divider(height: 1, thickness: 0.5, color: Colors.grey),
      ],
    );
  }
}

// 🔹 Placeholder pages
class PFSInfoPage extends StatelessWidget {
  const PFSInfoPage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Professors, Faculty and Staffs Information")));
}

class ROInfoPage extends StatelessWidget {
  const ROInfoPage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Room and Offices Information")));
}

