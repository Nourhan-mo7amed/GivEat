import 'package:flutter/material.dart';
import '../../../../color.dart';
import 'BusinessDetailsScreen.dart';
import '../widgets/reusable_text_field.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Create a new account",
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
                    labelText: 'Confirm Password',
                    hintText: 'Password',
                    suffixIcon: Icons.visibility_off_outlined,
                    obscureText: true,
                  ),

                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text('I agree to the '),
                      const Text(
                        'Terms Of Conditions',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), 
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusinessDetailsScreen(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors
                            .primaryColor, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      child: const Center(
                        child: Text(
                          'Create new account',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors
                                .primaryColor, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
