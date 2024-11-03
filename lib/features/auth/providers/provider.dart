import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/auth_service.dart';
import '../view%20model/auth_view_model.dart';

mixin class AuthProvider {
  static final Provider<AuthService> _authServiceProvider =
      Provider<AuthService>((ref) {
    return AuthService();
  });

  final ChangeNotifierProvider<AuthViewModel> authServiceViewModelProvider =
      ChangeNotifierProvider<AuthViewModel>((ref) {
    return AuthViewModel(authService: ref.read(_authServiceProvider));
  });
}

// final _authServiceProvider = Provider<AuthService>((ref) {
//   return AuthService();
// });

// final authServiceViewModelProvider =
//     ChangeNotifierProvider<AuthViewModel>((ref) {
//   return AuthViewModel(authService: ref.read(_authServiceProvider));
// });
