import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/data/repos/home_repo.dart';
part 'zikr_state.dart';

class ZikrCubit extends Cubit<ZikrState> {
  HomeRepo homeRepo;
  List<ZikrModel> azkar = [];
  ZikrCubit(this.homeRepo) : super(ZikrInitial());
  add({required ZikrModel zikrModel}) async {
    emit(ZikrInitial());
    await homeRepo.addZikr(zikrModel: zikrModel);
    emit(ZikrSuccess());
  }

  fetchAzkar() {
    emit(ZikrInitial());
    var box = Hive.box<ZikrModel>('zikr_info');
    azkar = box.values.toList();
    emit(ZikrSuccess());
  }
}
