import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'config/theme/app_theme.dart';

import 'config/routes/router.dart';

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
        routerConfig: AppRouter().router,
        title: 'Flutter Demo',
        theme: AppTheme().theme,
      ),
    );
  }
}
