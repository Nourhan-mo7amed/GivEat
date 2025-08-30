import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../widgets/reusable_text_field.dart';
class New_Passward extends StatefulWidget {
  const New_Passward({super.key});

  @override
  _New_PasswardState createState() => _New_PasswardState();
}

class _New_PasswardState extends State<New_Passward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,

      appBar: AppBar(backgroundColor: AppColors.backgroundColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'New Passward',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Create a new passward",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 25),

              // Password Field
              ReusableTextField(
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: Icons.visibility_off_outlined,
                obscureText: true,
              ),

              // Confirm Password Field
              ReusableTextField(
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: Icons.visibility_off_outlined,
                obscureText: true,
              ),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  child: const Text(
                    "Create new password",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
