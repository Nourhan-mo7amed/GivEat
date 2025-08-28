import 'package:flutter/material.dart';
import 'package:giveat/color.dart';
import 'ChatScreen.dart';
import 'DashboardHome.dart';
import 'ProfileScreen.dart';
import 'RequestsScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardHome(), // 👈 دي هتكون محتوى الهوم اللي كتبتيه
    const RequestsScreen(),
    const ProfileScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // هنا تحطي الأكشن اللي انتي عاوزاه
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Plus Button Pressed!")));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: const Color(0xff333234),
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Requests",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
      body: _screens[_currentIndex], // ✅ كل مرة يغير محتوى البودي
    );
  }
}
