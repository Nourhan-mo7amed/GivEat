import 'package:flutter/material.dart';

class RequestDetailsScreen extends StatelessWidget {
  final String title;
  final String date;
  final String quantity;
  final String charity;

  const RequestDetailsScreen({
    super.key,
    required this.title,
    required this.date,
    required this.quantity,
    required this.charity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dish: $title", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Date: $date"),
            Text("Quantity: $quantity"),
            Text("Charity: $charity"),
          ],
        ),
      ),
    );
  }
}
