import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'OTP_Page.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(backgroundColor: AppColors.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forget Password',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Please select option to send reset code',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const OptionTile(
              icon: Icons.email_outlined,
              title: 'Reset via email',
              subtitle:
                  'Code to reset your password will be sent to your email',
              isSelected: true,
            ),
            const SizedBox(height: 15),
            const OptionTile(
              icon: Icons.phone_in_talk_outlined,
              title: 'Reset via SMS number',
              subtitle:
                  'Code to reset your password will be sent to your SMS number',
              isSelected: false,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTP_Page()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.primaryColor, // استخدام اللون الجديد #17A87D
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;

  const OptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_circle, color: Color(0xff003B5C)),
        ],
      ),
    );
  }
}
