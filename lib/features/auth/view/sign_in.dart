import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/buttons_import.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../mixins/sign_in_mixin.dart';
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
              child: Text(signIn),
            ),
            MaxGap(AppPaddings.sPadding),

            /// Dont have an account
            const _DontHaveAnAccount(),
            const Spacer(),
            const OrDivider(),
            MaxGap(AppPaddings.lPadding),
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}

class _DontHaveAnAccount extends StatelessWidget {
  const _DontHaveAnAccount();

  static final String _dontHaveAnAccount =
      tr(LocaleKeys.signin_dontHaveAnAccount);
  static final String _createOne = tr(LocaleKeys.signin_createOne);
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
