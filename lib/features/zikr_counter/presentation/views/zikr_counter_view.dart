import 'package:flutter/material.dart';
import 'package:tasbeeh/constants.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/views/widgets/zikr_counter_view_body.dart';

class ZikrCounterView extends StatelessWidget {
  const ZikrCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        
      ),
      body: const ZikrCounterViewBody(),
    );
  }
}
