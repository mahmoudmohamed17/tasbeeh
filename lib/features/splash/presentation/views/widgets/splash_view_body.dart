import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasbeeh/core/utilities/app_router.dart';
import 'package:tasbeeh/core/utilities/assets_data.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    animateToHome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(AssetsData.logo)),
      ],
    );
  }
  void animateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}