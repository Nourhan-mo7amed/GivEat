import 'package:flutter/material.dart';
import '../../../../color.dart';
import '../views/RequestsScreen.dart';

Widget sectionHeader(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),

      InkWell(
        onTap: () {
          if (title == "Coming Requests") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RequestsScreen()),
            );
          } else if (title == "Donated") {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => const DonateScreen()),
            // );
          }
        },
        child: Text(
          "see all",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
