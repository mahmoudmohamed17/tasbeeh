import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/home/presentation/views/widgets/custom_text_field.dart';

void editZikrDialog(BuildContext context, ZikrModel zikrModel) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.start,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                BlocProvider.of<ZikrCubit>(context).fetchAzkar();                
                Navigator.pop(context);
              },
              child: Text(
                'تعديل',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3C3C3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'إلغاء',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ],
          content: CustomTextFormField(
            initialValue: zikrModel.text,
            onFieldSubmitted: (value) {
              zikrModel.text = value;
            },
          ),
        );
      });
}
