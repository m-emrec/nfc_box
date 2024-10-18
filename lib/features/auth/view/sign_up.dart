import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../logger.dart';
import 'widgets/email_field.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/or_divider.dart';
import 'widgets/password_field.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
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
                PasswordField(
                  controller: passwordController,
                ),
              ],
            ),

            MaxGap(AppPaddings.mPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text.rich(
                    softWrap: true,
                    TextSpan(
                      text: "I accept the ",
                      children: [
                        InlineTextButton(context, text: "Terms & Conditions"),
                      ],
                    ),
                  ),
                ),
                Checkbox(
                  value: false,
                  onChanged: (_) {},
                ),
              ],
            ),
            MaxGap(AppPaddings.lPadding),

            /// Sign In Button
            ResponsiveElevatedButton(
              onPressed: () {},
              child: const Text("Create Your Account"),
            ),
            MaxGap(AppPaddings.sPadding),

            /// Already have an account
            const _AlreadyHaveAnAccount(),
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

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  void onSignUpTapped(BuildContext context) {
    context.goNamed(Routes.signIn.name);
  }

  static const String _alreadyHaveAnAccount = "Already have an account ? ";
  static const String _signIn = 'Sign In';
  static const String _here = 'here';
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: _alreadyHaveAnAccount,
        children: [
          InlineTextButton(
            context,
            text: _signIn,
            onTap: () => onSignUpTapped(context),
            children: [
              TextSpan(
                text: " $_here",
                style: context.textTheme.bodyMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}
