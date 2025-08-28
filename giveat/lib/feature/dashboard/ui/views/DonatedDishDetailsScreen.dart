import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:giveat/color.dart';

import 'DishDetailsScreen.dart';

class DonatedDishDetailsScreen extends StatelessWidget {
  final String title;
  final String quantity;
  final String description;
  final String price;
  final String image;

  const DonatedDishDetailsScreen({
    super.key,
    required this.title,
    required this.quantity,
    required this.description,
    required this.price,
    required this.image,
  });

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // لازم يختار زرار
      barrierColor: Colors.black.withOpacity(0.3), // شفاف خلفية
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // البلور هنا
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              "Are you sure to delete?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            content: const Text(
              "This action cannot be undone.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Row(
                children: [
                  // زر Cancel
                  Expanded(
                    flex: 3, // مساحة أقل
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // زر Delete
                  Expanded(
                    flex: 5, child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 157, 60, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _showDeleteDialog(context),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DishDetailsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.edit, size: 18),
            label: const Text("Edit"),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 200, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "23 Aug, 10:30 PM",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),

          const Text(
            "Description:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.black87, fontSize: 13),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              const Text(
                "Quantity:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Chip(
                label: Text(
                  quantity,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            "Portion:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Text(
            "Serving 4 people.",
            style: TextStyle(color: Colors.black87, fontSize: 13),
          ),
          const SizedBox(height: 12),

          const Text(
            "Condition:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),

          Align(
            alignment: Alignment.centerLeft,
            child: Chip(
              label: const Text("Cooked"),
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
