import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh/constants.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/core/utilities/app_router.dart';
import 'package:tasbeeh/core/utilities/functions/edit_zikr_dialog.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/manager/counter_cubit/counter_cubit.dart';

class ZikrCategory extends StatelessWidget {
  const ZikrCategory({super.key, required this.zikrModel});
  final ZikrModel zikrModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kZikrCounterView, extra: zikrModel);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    zikrModel.text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                    textAlign: TextAlign.right,
                  ),
                ),
                // const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        zikrModel.delete();
                        BlocProvider.of<ZikrCubit>(context).fetchAzkar();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(right: 40),
                      onPressed: () {
                        editZikrDialog(context, zikrModel);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        textAlign: TextAlign.end,
                        'عدد التسبيح: ${zikrModel.total}',
                        style: Styles.textStyle16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
