import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasbeeh/core/utilities/app_router.dart';
import 'package:tasbeeh/features/home/data/models/zikr_model.dart';
import 'package:tasbeeh/features/home/data/repos/home_repo_impl.dart';
import 'package:tasbeeh/features/home/presentation/manager/zikr_cubit/zikr_cubit.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/manager/counter_cubit/counter_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ZikrModelAdapter());
  await Hive.openBox<ZikrModel>('zikr_info');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ZikrCubit(HomeRepoImpl()),
        ),
         BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
