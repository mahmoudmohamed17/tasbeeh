import 'package:tasbeeh/features/home/data/models/zikr_model.dart';

abstract class HomeRepo {
  Future<void> addZikr({required ZikrModel zikrModel});
}