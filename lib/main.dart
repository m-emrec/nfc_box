import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

import 'config/theme/app_theme.dart';

import 'config/routes/router.dart';
import 'core/constants/app_assets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'NFCBox',
        theme: AppTheme().theme,
      ),
    );
  }
}

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
