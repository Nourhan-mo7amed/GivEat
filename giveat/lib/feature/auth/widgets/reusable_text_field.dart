import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const ReusableTextField({
    super.key,
    required this.labelText,
    this.hintText = '',
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: hintText.isNotEmpty ? hintText : labelText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, 
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
