import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/widgets/custom_toast.dart';
import '../model/credentials.dart';
import '../providers/provider.dart';
import '../view/sign_up.dart';

mixin SignUpMixin on ConsumerState<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isAccepted = false;

  Future<void> onTapSignUp() async {
    if (formKey.currentState?.validate() ?? false) {
      if (isAccepted) {
        await ref
            .read(AuthProvider.authServiceViewModelProvider.notifier)
            .signUpWithEmail(
              Credentials(
                  email: emailController.text,
                  password: passwordController.text),
            );
      } else {
        Toast.errToast(title: pleaseAcceptTermsConditions);
      }
    }
  }

  final String pleaseAcceptTermsConditions = 'Please accept Terms & Conditions';
  final String createYourAccount = 'Create Your Account';
}
