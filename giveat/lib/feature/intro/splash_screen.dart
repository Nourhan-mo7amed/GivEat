
import 'package:flutter/material.dart';
import 'package:giveat/core/constant/color.dart';
import 'onbording.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()), 
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
