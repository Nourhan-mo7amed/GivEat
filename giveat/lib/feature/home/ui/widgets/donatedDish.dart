 import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../color.dart';

Widget donatedDish(String title, String qty, String desc, String price) {
    return SizedBox(
      width: 220, 
      child: Card(
        elevation: 3,
        color: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   side: const BorderSide(color: Colors.grey, width: 1),
        // ),
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
              Text(
                desc,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
              Text(
                price,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
