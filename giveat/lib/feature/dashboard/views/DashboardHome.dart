import 'package:flutter/material.dart';

import '../widgets/donatedDish.dart';
import '../widgets/requestCard.dart';
import '../widgets/searchBar.dart';
import '../widgets/sectionHeader.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ===== Header =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Name!",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text("Ready to donate?"),
                ],
              ),
              Icon(Icons.notifications_none),
            ],
          ),
          const SizedBox(height: 16),

          // ===== Search Bar =====
          const SearchBarWidget(),
          const SizedBox(height: 20),

          // ===== Coming Requests =====
          sectionHeader(context, "Coming Requests"),
          const SizedBox(height: 10),

          requestCard(
            context,
            "Rice Bowls",
            "23 Aug, 10:30 PM",
            "x20",
            "Resala Charity",
          ),
          requestCard(
            context,
            "Chicken Soup",
            "23 Aug, 10:30 PM",
            "x15",
            "Orman Association",
          ),

          const SizedBox(height: 20),

          // ===== Donated Dishes =====
          sectionHeader(context, "Donated Dishes"),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            width: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                donatedDish(
                  context,
                  "Meat & Potatoes",
                  "x20",
                  "One meal feeds up to 4",
                  "Free",
                ),
                const SizedBox(width: 10),
                donatedDish(
                  context,
                  "Breakfast",
                  "x1",
                  "Feeds 1 person",
                  "15£ Each",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ===== Explore Charities =====
          sectionHeader(context, "Explore Charities"),
          const SizedBox(height: 10),
          Card(
            color: Colors.white,
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/r.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Resala Charity partners with restaurants to deliver meals to families in need, turning surplus food into hope.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
