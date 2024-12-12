import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'core/constants/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(
      Future.delayed(
        const Duration(seconds: 3),
        () {
          if (context.mounted) {
            context.go("/");
          }
        },
      ),
    );
    return Scaffold(
      body: Center(
        child: Lottie.asset(AppAssets.splashAni, repeat: false),
      ),
    );
  }
}
