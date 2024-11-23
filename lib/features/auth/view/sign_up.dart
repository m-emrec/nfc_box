import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/widgets/buttons/buttons_import.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../../../core/utils/widgets/custom bottom sheet/custom_bottom_sheet.dart';
import '../mixins/sign_up_mixin.dart';
import 'widgets/auth_form.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/or_divider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> with SignUpMixin {
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
            ),

            MaxGap(AppPaddings.mPadding),
            _TermsAndConditions(
              isAccepted: isAccepted,
              onAcceptedChanged: (value) {
                setState(() {
                  isAccepted = value;
                });
              },
            ),
            MaxGap(AppPaddings.lPadding),

            /// Sign In Button
            ResponsiveElevatedButton(
              onPressed: onTapSignUp,
              child: Text(createYourAccount),
            ),
            MaxGap(AppPaddings.sPadding),

            /// Already have an account
            const _AlreadyHaveAnAccount(),
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

class _TermsAndConditions extends StatefulWidget {
  final bool isAccepted;
  final ValueChanged<bool> onAcceptedChanged;

  const _TermsAndConditions({
    required this.isAccepted,
    required this.onAcceptedChanged,
  });

  @override
  State<_TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<_TermsAndConditions> {
  static final String _iAcceptThe = tr(LocaleKeys.signup_iAcceptThe);
  static final String _termsConditions =
      tr(LocaleKeys.signup_termsAndConditions);

  void showTermsAndConditions(BuildContext context) {
    CustomBottomSheet.show(
      context,
      widget: _bottomSheet(context),
    );
  }

  _bottomSheet(BuildContext context) {
    return CustomBottomSheet(
      content: SizedBox(
          height: context.screenSize.height * 0.7,
          child: Markdown(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            selectable: true,
            data: tr(LocaleKeys.signup_termAndConditionsText),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text.rich(
            softWrap: true,
            TextSpan(
              text: "$_iAcceptThe ",
              children: [
                InlineTextButton(
                  context,
                  text: _termsConditions,
                  onTap: () => showTermsAndConditions(context),
                ),
              ],
            ),
          ),
        ),
        Checkbox(
          value: widget.isAccepted,
          onChanged: (val) => widget.onAcceptedChanged(val ?? false),
        ),
      ],
    );
  }
}

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  void onSignUpTapped(BuildContext context) {
    context.goNamed(Routes.signIn.name);
  }

  static final String _alreadyHaveAnAccount =
      tr(LocaleKeys.signup_alreadyHaveAnAccount);
  static final String _signIn = tr(LocaleKeys.signin_signin);
  static final String _here = tr(LocaleKeys.signup_here);
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
