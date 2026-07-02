import 'package:bookia/features/auth/presentation/views/login_screen.dart';
import 'package:bookia/features/auth/presentation/views/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../thems/app_colors.dart';
import '../widgets/reusable_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: .infinity,
        width: .infinity,
        padding: .all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: .cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset("assets/images/logo2.png"),
            SizedBox(height: 10),
            Text(
              "Order Your Book Now!",
              style: TextStyle(
                fontFamily: "GoogleFonts",
                color: AppColors.darkFontColor,
                fontSize: 20,
                fontWeight: .w400,
              ),
            ),
            SizedBox(height: 300),
            ReusableButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              title: "Login",
              buttonBGColor: AppColors.primaryColor,
              titleColor: AppColors.whiteFontColor,
            ),
            SizedBox(height: 15),
            ReusableButton(
              title: "Register",
              buttonBGColor: AppColors.primaryColor,
              titleColor: AppColors.darkFontColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
