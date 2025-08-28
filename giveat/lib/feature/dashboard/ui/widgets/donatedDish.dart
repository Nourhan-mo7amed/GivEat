import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../color.dart';
import '../views/DonatedDishDetailsScreen.dart';

Widget donatedDish(BuildContext context, String title, String qty, String desc, String price) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DonatedDishDetailsScreen(
            title: title,
            quantity: qty,
            description: desc,
            price: price,
            image: "assets/images/a.jpg", // تقدر تخليها باراميتر لو الصور مختلفة
          ),
        ),
      );
    },
    child: SizedBox(
      width: 220,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/a.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(qty, style: const TextStyle(fontSize: 12)),
              Text(desc, style: const TextStyle(fontSize: 11, color: Colors.black54)),
              Text(price, style: const TextStyle(color: AppColors.primaryColor)),
            ],
          ),
        ),
      ),
    ),
  );
}
