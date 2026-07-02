import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final Color buttonBGColor;
  final Color titleColor;

  final VoidCallback onPressed;

  const ReusableButton({
    super.key,
    required this.title,
    required this.buttonBGColor,
    required this.onPressed,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        color: buttonBGColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w500,
                color: titleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
