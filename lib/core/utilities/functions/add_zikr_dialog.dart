import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/home/presentation/views/widgets/zikr_info_form.dart';

void addZikrDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {
                BlocProvider.of<ZikrCubit>(context).add(zikrModel: zikrModel!);
                BlocProvider.of<ZikrCubit>(context).fetchAzkar();
                Navigator.pop(context);
              },
              child: Text(
                'إضافة',
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
              child: Text('إلغاء',
                  style: Styles.textStyle16.copyWith(color: Colors.white)),
            ),
          ],
          actionsAlignment: MainAxisAlignment.start,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            // alignment: Alignment.center,
            child: const ZikrInfoForm(),
          ),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        );
      });
}
