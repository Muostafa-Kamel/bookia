import 'dart:async';

import 'package:bookia/features/auth/presentation/views/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../thems/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _State();
}

class _State extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Center(child: Image.asset("assets/images/logo2.png")),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Order Your Book Now!",
              style: TextStyle(
                fontFamily: "GoogleFonts",
                color: AppColors.darkFontColor,
                fontSize: 20,
                fontWeight: .w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
