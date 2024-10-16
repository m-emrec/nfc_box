import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
                      controller: TextEditingController(),
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
            Text.rich(
              TextSpan(
                text: "Don't have an account ? ",
                children: [
                  InlineTextButton(
                    context,
                    text: "Create One",
                  ),
                ],
              ),
            ),
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
