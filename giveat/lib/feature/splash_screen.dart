// Splash Screen

import 'package:flutter/material.dart';
import 'package:giveat/color.dart';

import 'auth/ui/views/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بعد 3 ثواني يروح على صفحة اللوجين
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/giveat.png', width: 200, height: 200),
            const Text(
              "GivEat",
              style: TextStyle(
                fontSize: 35,
                //fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: 'RussoOne',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
