import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/home/presentation/views/widgets/zikr_category.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZikrCubit, ZikrState>(
      builder: (context, state) {
        List<ZikrModel> azkar = BlocProvider.of<ZikrCubit>(context).azkar;
        if(state is ZikrInitial) {
          return Container(
            color: Colors.yellow,
            child: Text(
              'لا يوجد لديك أذكار، قم بإضافة ذكر الآن',
              style: Styles.textStyle48.copyWith(color:  Colors.grey),
            ),
          );
        }
        else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            itemCount: azkar.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ZikrCategory(
                 
                  zikrModel: azkar[index],
                ),
              );
            });
        }
        
      },
    );
  }
}
