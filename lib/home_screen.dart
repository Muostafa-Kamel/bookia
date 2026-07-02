import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/thems/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: Image.asset("assets/images/logo2.png", height: 100),
        actions: [Icon(Icons.search_sharp, size: 35)],
      ),
      body: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Center(child: Text("Home!", style: TextStyle(fontSize: 28))),
        ],
      ),
    );
  }
}
