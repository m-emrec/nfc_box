import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/features/create%20item/view/create%20item%20page/create_item_page.dart';
import 'package:nfc_box/features/home/view/home.dart';
import 'package:nfc_box/features/items/view/item_list_page.dart';
import '../../features/auth/service/auth_service.dart';

import '../../features/auth/view/sign_in.dart';
import '../../features/auth/view/sign_up.dart';
import 'auth_checker.dart';

enum Routes {
  signIn,
  signUp,
  itemList,
  createItem;

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

  static final GoRouter _router = GoRouter(
    refreshListenable: _authChangeNotifier,
    initialLocation: "/",
    // redirect: _authChecker,
    routes: [
      /// Home Page
      GoRoute(
        redirect: _authChecker,
        path: '/',
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: Routes.itemList.path,
            name: Routes.itemList.name,
            builder: (context, state) => const ItemListPage(),
          ),
          GoRoute(
            path: Routes.createItem.path,
            name: Routes.createItem.name,
            builder: (context, state) => const CreateItemPage(),
          ),
        ],
      ),

      /// [SignUp] page
      GoRoute(
        redirect: _authChecker,
        name: Routes.signUp.name,
        path: Routes.signUp.path,
        builder: (context, state) => const SignUp(),
      ),

      /// [SignIn] page
      GoRoute(
        redirect: _authChecker,
        name: Routes.signIn.name,
        path: Routes.signIn.path,
        builder: (context, state) => const SignIn(),
      ),
    ],
  );

  /// This function checks if the user is authenticated or not.
  ///
  /// If user is trying to reach home page but he is not authenticated ,
  /// he will be redirected to [SignIn]
  ///
  ///
  static FutureOr<String?> _authChecker(context, GoRouterState state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final bool loggingIn = state.matchedLocation == Routes.signIn.path;
    final bool signingUp = state.matchedLocation == Routes.signUp.path;
    final currentPath = state.fullPath;

    // If the user is not logged in and current path is not [Routes.signUp] redirect to the login page
    if (!isLoggedIn && currentPath != Routes.signUp.path) {
      return Routes.signIn.path;
    }

    // If the user is logged in and tries to access login, redirect to home
    if (loggingIn || signingUp && isLoggedIn) return '/';

    // No redirection needed
    return null;
  }
}
