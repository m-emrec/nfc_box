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
  void onTapSignUp() {
    if (formKey.currentState?.validate() ?? false) {
      if (isAccepted) {
        ref.read(authServiceViewModelProvider.notifier).signUpWithEmail(
              Credentials(
                  email: emailController.text,
                  password: passwordController.text),
            );
      } else {
        Toast.errToast(title: "Please accept Terms & Conditions");
      }
    }
  }

  final String createYourAccount = 'Create Your Account';
}
