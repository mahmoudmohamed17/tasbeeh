import 'package:flutter/material.dart';
import 'package:tasbeeh/constants.dart';
import 'package:tasbeeh/core/styles/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
       this.hintText,
      this.keyboardType,
      this.onFieldSubmitted,
      this.initialValue});
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      style: Styles.textStyle16.copyWith(color: Colors.black),
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusColor: Colors.black,
          hintTextDirection: TextDirection.rtl,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: Styles.textStyle16.copyWith(color: Colors.grey),
          // floatingLabelAlignment: FloatingLabelAlignment.center,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
