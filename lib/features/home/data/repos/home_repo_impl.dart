import 'package:hive/hive.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<void> addZikr({required ZikrModel zikrModel}) async {
    var box = Hive.box<ZikrModel>('zikr_info');
    await box.add(zikrModel);
  }
}
