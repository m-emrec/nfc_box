// ChangeNotifier to refresh the router
import 'package:flutter/material.dart';

class AuthChangeNotifier extends ChangeNotifier {
  void notify() {
    notifyListeners(); // This triggers the router to rebuild
  }
}
