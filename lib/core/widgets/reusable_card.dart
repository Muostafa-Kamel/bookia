import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String iconPath;
  final String title;


  const ReusableCard({
    super.key, required this.iconPath, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(iconPath,height: 25,),
            SizedBox(width: 5,),
            Text(title)
          ],
        ),
      ),
    );
  }
}
