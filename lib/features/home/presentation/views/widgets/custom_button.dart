import 'package:flutter/material.dart';
import 'package:tasbeeh/core/styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: Styles.textStyle16,
      ),
    );
  }
}