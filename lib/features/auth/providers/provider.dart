import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/features/auth/service/auth_service.dart';
import 'package:nfc_box/features/auth/view%20model/auth_view_model.dart';

final _authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authServiceViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel(authService: ref.read(_authServiceProvider));
});
