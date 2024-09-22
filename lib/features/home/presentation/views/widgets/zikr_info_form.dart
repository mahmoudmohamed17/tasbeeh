import 'package:flutter/material.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/presentation/views/widgets/custom_text_field.dart';

class ZikrInfoForm extends StatefulWidget {
  const ZikrInfoForm({super.key});
  @override
  State<ZikrInfoForm> createState() => _ZikrInfoFormState();
}

ZikrModel? zikrModel;

class _ZikrInfoFormState extends State<ZikrInfoForm> {
  String? text, count;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          hintText: 'الذكر',
          onFieldSubmitted: (value) {
            text = value;
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextFormField(
          hintText: 'عدد الحبات',
          keyboardType: TextInputType.number,
          onFieldSubmitted: (value) {
            count = value;

            zikrModel = ZikrModel(text: text!, count: count!);
          },
        ),
      ],
    );
  }
}
