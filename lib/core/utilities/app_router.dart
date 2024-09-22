import 'package:go_router/go_router.dart';
import 'package:tasbeeh/features/home/presentation/views/home_view.dart';
import 'package:tasbeeh/features/splash/presentation/views/splash_view.dart';
import 'package:tasbeeh/features/zikr_counter/presentation/views/zikr_counter_view.dart';

abstract class AppRouter {
  static String kHomeView = '/homeView';
  static String kZikrCounterView = '/zikrCounterView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(), // initial path (screen)
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kZikrCounterView,
      builder: (context, state) => const ZikrCounterView(),
    ),
  ]);
}
