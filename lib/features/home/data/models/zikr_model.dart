import 'package:hive/hive.dart';
part 'zikr_model.g.dart';

@HiveType(typeId: 0)
class ZikrModel extends HiveObject {
  @HiveField(0)
  String text;
  @HiveField(1)
  String count;
  @HiveField(2)
  int total = 0;
  @HiveField(3)
  int currentCount = 0;
  @HiveField(4)
  int rounds = 0;
  @HiveField(5)
  int temp = 0;

  ZikrModel({required this.text, required this.count});
}
