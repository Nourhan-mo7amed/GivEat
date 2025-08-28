import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../color.dart';
import 'New_Passward_Page.dart';

class OTP_Page extends StatelessWidget {
  const OTP_Page({super.key});

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
                'Enter Code',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "We've sent a message with an activation code to your email cs*********@**",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 25),

              // OTP Input Field
              Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                showCursor: true,
                onCompleted: (pin) {
                  print("OTP Entered: $pin");
                },
              ),

              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => New_Passward()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor,  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive OTP?  "),
                  Text(
                    "Re-send Code",
                    style: TextStyle(
                      color: AppColors
                          .primaryColor,   fontWeight: FontWeight.bold,
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
