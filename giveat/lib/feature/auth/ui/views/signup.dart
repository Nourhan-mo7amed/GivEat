import 'package:flutter/material.dart';
import 'package:giveat/feature/auth/ui/views/login.dart';
import '../../../../color.dart';
import '../widgets/reusable_text_field.dart'; // استيراد مكون ReusableTextField
import 'NextPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedGender = "female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 70),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Create anew account',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 20),

              // Name Field
              ReusableTextField(
                labelText: 'Name',
                hintText: 'Name',
                suffixIcon: Icons.person,
              ),
              // Email Field
              ReusableTextField(
                labelText: 'Email',
                hintText: 'Email',
                suffixIcon: Icons.email_outlined,
              ),
              // Phone Field
              ReusableTextField(
                labelText: 'Phone',
                hintText: '+20',
                suffixIcon: Icons.tag,
              ),
              const SizedBox(height: 20),

              // Gender Selection
              const Text(
                "Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.male),
                          Text("Male", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      value: "male",
                      groupValue: selectedGender,

                      onChanged: (value) {
                        setState(() {
                          selectedGender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Row(
                        children: [
                          Icon(Icons.female),
                          Text("Female", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      value: "female",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor, // استخدام اللون الجديد #17A87D
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Next',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Back to Sign In
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors
                                .primaryColor, // استخدام اللون من ملف الألوان
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
