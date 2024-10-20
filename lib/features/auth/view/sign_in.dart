import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:nfc_box/config/routes/router.dart';
import 'package:nfc_box/features/auth/mixins/sign_in_mixin.dart';
import 'package:nfc_box/features/auth/model/credentials.dart';
import 'package:nfc_box/features/auth/providers/provider.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../logger.dart';
import 'widgets/auth_form.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/or_divider.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> with SignInMixin {
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
            AuthForm(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              showForgotPassword: true,
            ),
            MaxGap(AppPaddings.lPadding),

            /// Sign In Button
            ResponsiveElevatedButton(
              onPressed: onTapSignIn,
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
