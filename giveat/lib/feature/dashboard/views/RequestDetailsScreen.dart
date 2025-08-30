import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class RequestDetailsScreen extends StatelessWidget {
  final String title;
  final String dateTime;
  final String quantity;
  final String charity;

  const RequestDetailsScreen({
    super.key,
    required this.title,
    required this.dateTime,
    required this.quantity,
    required this.charity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Requested Dish",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/a.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        quantity,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  dateTime,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Description:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              "A hearty bowl of rice served with fresh toppings for a simple, tasty meal.",
              style: TextStyle(color: Colors.black87),
            ),

            const SizedBox(height: 16),

            const Text(
              "Pickup Location:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              "Qui fugiat dicta distinctio illum est placeat accusantium.",
              style: TextStyle(color: AppColors.primaryColor),
            ),

            const SizedBox(height: 16),

            const Text(
              "Posted By:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(charity, style: const TextStyle(fontSize: 14)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // أزرار Cancel & Approve
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Approve",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
