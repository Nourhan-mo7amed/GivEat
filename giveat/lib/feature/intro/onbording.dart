import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constant/color.dart';
import '../auth/views/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<Map<String, String>> pages = [
    {
      "animation": "assets/animations/food_donate.json",
      "title": "Save Surplus Food",
      "subtitle":
          "Connect surplus meals from restaurants and shops with people who need them most.",
    },
    {
      "animation": "assets/animations/community.json",
      "title": "Support Communities",
      "subtitle":
          "Help charities and community groups access fresh food and reduce hunger.",
    },
    {
      "animation": "assets/animations/recycle.json",
      "title": "Reduce Food Waste",
      "subtitle":
          "Join us in building a sustainable future by cutting down on food waste together.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == pages.length - 1;
            });
          },
          itemBuilder: (context, index) {
            final page = pages[index];
            return buildPage(
              animation: page["animation"]!,
              title: page["title"]!,
              subtitle: page["subtitle"]!,
              index: index,
              isLast: isLastPage,
            );
          },
        ),
      ),
    );
  }

  Widget buildPage({
    required String animation,
    required String title,
    required String subtitle,
    required int index,
    bool isLast = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, height: 250),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 100),

          SmoothPageIndicator(
            controller: _controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor,
              dotColor: AppColors.backgroundColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
          ),

          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (isLast) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),  ),
                );
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
              isLast ? "Get Started" : "Next",
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}