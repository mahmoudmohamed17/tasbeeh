import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh/constants.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/core/utilities/functions/alert_dialog.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/views/widgets/zikr_counter_info.dart';

class ZikrCounterViewBody extends StatelessWidget {
  const ZikrCounterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var zikrModel = GoRouterState.of(context).extra! as ZikrModel;
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              zikrModel.text,
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZikrCounterInfo(text: 'العدد الكلي', count: zikrModel.total),
                ZikrCounterInfo(text: 'الدورة', count: zikrModel.rounds),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            //
            GestureDetector(
              onTap: () {
                BlocProvider.of<CounterCubit>(context).incremenet(count: zikrModel.count, zikrModel: zikrModel);
              },
              child: Container(
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(175),
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.41,
                child: Text(
                  '${zikrModel.currentCount}',
                  style: Styles.textStyle48,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      // color: kPrimaryColor,
                      onPressed: () {
                        alertDialog(context, zikrModel);
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.black,
                        size: 35,
                      )),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
