import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/routes/router.dart';
import 'package:nfc_box/logger.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import 'widgets/email_field.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/or_divider.dart';
import 'widgets/password_field.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: AppPaddings.authHPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logoPath),

            const Spacer(
              flex: 3,
            ),
            Column(
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
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MaxGap(AppPaddings.lPadding),

            /// Sign In Button
            ResponsiveElevatedButton(
              onPressed: () {},
              child: const Text("Sign In"),
            ),
            MaxGap(AppPaddings.sPadding),

            /// Dont have an account
            const _DontHaveAnAccount(),
            const Spacer(),
            const OrDivider(),
            MaxGap(AppPaddings.lPadding),
            const GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}

class _DontHaveAnAccount extends StatelessWidget {
  const _DontHaveAnAccount();

  static const String _dontHaveAnAccount = "Don't have an account ?";
  static const String _createOne = " Create One";
  void onSignUpTapped(BuildContext context) {
    context.goNamed(Routes.signUp.name);
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: _dontHaveAnAccount,
        children: [
          InlineTextButton(
            context,
            text: _createOne,
            onTap: () => onSignUpTapped(context),
          ),
        ],
      ),
    );
  }
}
