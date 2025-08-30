import 'package:flutter/material.dart';

import '../widgets/ProfileItem.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                // Avatar
                const CircleAvatar(
                  radius: 44,
                  backgroundImage: AssetImage('assets/images/r.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Windigo Resturant',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  '0190278304',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),
                const SizedBox(height: 24),
                ProfileItem(
                  icon: Icons.edit_outlined,
                  text: 'Edit profile',
                  onTap: () {},
                ),
                ProfileItem(
                  icon: Icons.help_outline,
                  text: 'Help',
                  onTap: () {},
                ),
                ProfileItem(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
