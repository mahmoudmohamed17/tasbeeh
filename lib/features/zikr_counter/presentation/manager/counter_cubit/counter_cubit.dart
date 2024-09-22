import 'package:bloc/bloc.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incremenet({required String count, required ZikrModel zikrModel}) {
    zikrModel.currentCount++;
    zikrModel.total++;
    zikrModel.temp++;
    if ((zikrModel.currentCount.toString().compareTo(count)) == 0) {
      zikrModel.rounds++;
      zikrModel.currentCount = 0;
      zikrModel.temp = 0;
    }
    emit(CounterSuccess());
  }

  void returnToZero({required ZikrModel zikrModel}) {
    if (zikrModel.currentCount == 0) {
      return;
    } else {
      zikrModel.currentCount = 0;
      zikrModel.total = zikrModel.total - zikrModel.temp;
      zikrModel.temp = 0;
    }
    emit(CounterSuccess());
  }
}
