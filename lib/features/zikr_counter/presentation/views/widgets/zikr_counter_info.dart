import 'package:flutter/material.dart';
import 'package:tasbeeh/core/styles/styles.dart';

class ZikrCounterInfo extends StatelessWidget {
  const ZikrCounterInfo({super.key, required this.text, required this.count});
  final String text;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$count',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
