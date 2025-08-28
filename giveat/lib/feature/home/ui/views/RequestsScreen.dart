import 'package:flutter/material.dart';
import '../widgets/requestCard.dart';
import '../widgets/searchBar.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===== Search Bar =====
            SizedBox(height: 30),
            const SearchBarWidget(),

            const SizedBox(height: 30),
            requestCard(
              "Rice Bowls",
              "23 Aug, 10:30 PM",
              "x20",
              "Resala Charity",
            ),
            requestCard(
              "Chicken Soup",
              "23 Aug, 10:30 PM",
              "x15",
              "Orman Association",
            ),
            requestCard(
              "Besella",
              "23 Aug, 10:30 PM",
              "x15",
              "Orman Association",
            ),
            requestCard("Meat", "23 Aug, 10:30 PM", "x15", "Orman Association"),
          ],
        ),
      ),
    );
  }
}
