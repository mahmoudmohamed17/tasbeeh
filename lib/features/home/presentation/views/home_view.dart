import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbeeh/constants.dart';
import 'package:tasbeeh/core/styles/styles.dart';
import 'package:tasbeeh/core/utilities/functions/add_zikr_dialog.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<ZikrCubit>(context).fetchAzkar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'الرئيسية',
              style: Styles.textStyle24.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addZikrDialog(context);
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.add,
          color: kPrimaryColor,
          size: 35,
        ),
      ),
    );
  }

  }
