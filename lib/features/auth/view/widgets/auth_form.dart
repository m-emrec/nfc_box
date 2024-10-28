import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/core/utils/widgets/custom%20bottom%20sheet/custom_bottom_sheet.dart';

import '../../../../core/constants/app_paddings.dart';
import 'email_field.dart';
import 'forgot_password_sheet.dart';
import 'password_field.dart';

/// AuthForm is a [StatelessWidget] that returns a [Form] widget
/// with [EmailField] and [PasswordField] as children
/// [showForgotPassword] is a boolean that determines if the [ForgotPasswordSheet] should be shown
/// [formKey] is a [GlobalKey<FormState>] that is used to validate the form
/// [emailController] is a [TextEditingController] that is used to control the email field
/// [passwordController] is a [TextEditingController] that is used to control the password field
/// [forgotPassword] is a string that is used as the text for the [TextButton] that shows the [ForgotPasswordSheet]
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

              /// if [showForgotPassword] is true , show ForgotPassword button
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

  void showForgotPasswordSheet(BuildContext context) {
    CustomBottomSheet.show(
      context,
      widget: ForgotPasswordSheet(),
    );
  }
}
