 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/manager/counter_cubit/counter_cubit.dart';

void alertDialog(BuildContext context, ZikrModel zikrModel) {
     showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              textDirection: TextDirection.rtl,
              'سوف يتم تصفير ما قمت به فى هذه الجلسة!',
              style: Styles.textStyle24
                  .copyWith(color: Colors.black),
            ),
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    )),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context)
                      .returnToZero(zikrModel: zikrModel);
    
                  Navigator.pop(context);
                },
                child: Text(
                  'تصفير',
                  style: Styles.textStyle16
                      .copyWith(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3C3C3D),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'إلغاء',
                  style: Styles.textStyle16
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }