import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/features/auth/view/widgets/forgot_password_sheet.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/colors.dart';
import 'email_field.dart';
import 'password_field.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.showForgotPassword = false,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool showForgotPassword;
  final String forgotPassword = 'Forgot Password';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// EmailField
          EmailField(
            controller: emailController,
          ),
          Gap(AppPaddings.mPadding),

          /// PasswordField
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PasswordField(
                controller: passwordController,
              ),
              Visibility(
                visible: showForgotPassword,
                child: TextButton(
                  onPressed: () => showForgotPasswordSheet(context),
                  child: Text(
                    forgotPassword,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PersistentBottomSheetController showForgotPasswordSheet(
      BuildContext context) {
    return showBottomSheet(
      context: context,
      builder: (context) => ForgotPasswordSheet(),
    );
  }
}
