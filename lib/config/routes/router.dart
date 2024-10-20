// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/features/auth/service/auth_service.dart';

import '../../features/auth/view/sign_in.dart';
import '../../features/auth/view/sign_up.dart';
import '../../playground.dart';
import 'auth_checker.dart';

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
  AppRouter() {
    AuthService().authStateChanges.listen((user) {
      _authChangeNotifier.notify();
    });
  }
  GoRouter get router => _router;
  static final AuthChangeNotifier _authChangeNotifier = AuthChangeNotifier();

  final _router = GoRouter(
    refreshListenable: _authChangeNotifier,
    initialLocation: "/",
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final loggingIn = state.uri.toString() == Routes.signIn.path;

      // If the user is not logged in, redirect to the login page
      if (!isLoggedIn && !loggingIn) return Routes.signIn.path;

      // If the user is logged in and tries to access login, redirect to home
      if (isLoggedIn && loggingIn) return '/';

      // No redirection needed
      return null;
    },
    routes: [
      /// Home Page
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
      ),

      /// [SignIn] page
      GoRoute(
        name: Routes.signIn.name,
        path: Routes.signIn.path,
        builder: (context, state) => const SignIn(),
      ),
    ],
  );
}
