import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/logger.dart';

import '../../features/auth/view/sign_in.dart';
import '../../features/auth/view/sign_up.dart';
import '../../playground.dart';

enum Routes {
  signIn,
  signUp,
  ;

  String get path => "/$name";
  final String? data;

  const Routes({
    this.data,
  });
}

class AppRouter {
  GoRouter get router => _router;
// GoRouter configuration
  final _router = GoRouter(
    initialLocation: Routes.signUp.path,
    routes: [
      /// Home Page
      /// TODO: Change this when you built Home
      GoRoute(
        path: '/',
        builder: (context, state) => const PlayGround(),
        routes: const [],
      ),

      /// [SignUp] page
      GoRoute(
        name: Routes.signUp.name,
        path: Routes.signUp.path,
        builder: (context, state) => const SignUp(),
        // pageBuilder: (context, state) => CustomTransitionPage(
        //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //     Animation<Offset> a =
        //         Tween<Offset>(end: Offset(0, 0), begin: Offset(1000, 400))
        //             .animate(animation);

        //     return SizeTransition(
        //       sizeFactor: animation,
        //       child: child,
        //     );
        //   },
        //   child: const SignUp(),
        // ),
      ),

      /// [SignIn] page
      GoRoute(
        name: Routes.signIn.name,
        path: Routes.signIn.path,
        builder: (context, state) => const SignIn(),
        // pageBuilder: (context, state) => CustomTransitionPage(
        //   key: state.pageKey,
        //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //     return FadeTransition(
        //       opacity: animation,
        //       child: child,
        //     );
        //   },
        //   child: const SignIn(),
        // ),
      ),
    ],
  );
}
