import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view/sign_in.dart';
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
    initialLocation: Routes.signIn.path,
    routes: [
      /// Home Page
      /// TODO: Change this when you built Home
      GoRoute(
        path: '/',
        builder: (context, state) => PlayGround(),
        routes: [],
      ),

      // /// [SignUp] page
      // GoRoute(
      //   name: Routes.signUp.name,
      //   path: Routes.signUp.path,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return FadeTransition(opacity: animation, child: child);
      //     },
      //     child: SignUp(),
      //   ),
      // ),

      /// [SignIn] page
      GoRoute(
        name: Routes.signIn.name,
        path: Routes.signIn.path,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: SignIn(),
        ),
      ),
    ],
  );
}
