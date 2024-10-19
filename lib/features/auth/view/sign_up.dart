import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/core/utils/widgets/custom_toast.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/widgets/buttons/inline_text_button.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../logger.dart';
import 'widgets/auth_form.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/or_divider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void onTapSignUp() {
    if (formKey.currentState?.validate() ?? false) {
      logger.d("Valid");
    } else {
      logger.d("Not Valid");
    }
  }

  final String createYourAccount = 'Create Your Account';
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
            const _TermsAndConditions(),
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
            const GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}

class _TermsAndConditions extends StatefulWidget {
  const _TermsAndConditions();

  @override
  State<_TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<_TermsAndConditions> {
  static const String _iAcceptThe = 'I accept the';
  static const String _termsConditions = 'Terms & Conditions';

  bool _isAccepted = false;

  void showTermsAndConditions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(maxHeight: context.screenSize.height * .9),
      enableDrag: true,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 5,
      showDragHandle: true,
      builder: (context) => _bottomSheet(),
    );
  }

  SingleChildScrollView _bottomSheet() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Markdown(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: AppPaddings.authHPadding +
                  EdgeInsets.only(bottom: AppPaddings.lPadding),
              data: """
# NFCBox Terms and Conditions

**Last Updated:** [Date]

Welcome to NFCBox. By downloading, installing, or using the NFCBox mobile application ("App"), you agree to be bound by the following terms and conditions ("Terms"). Please read these Terms carefully before using our services.

## 1. Acceptance of Terms

By accessing or using the NFCBox App, you agree to comply with and be bound by these Terms and all applicable laws and regulations. If you do not agree with any part of these Terms, you must not use the App.

## 2. Use of the App

NFCBox is designed to help users manage NFC chips and their associated data. You are responsible for ensuring that your use of the App is in compliance with all applicable laws and regulations.

## 3. Account Registration

To use some features of NFCBox, you may be required to create an account. You agree to provide accurate and complete information when registering for an account and to keep this information up to date. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.

## 4. NFC Chip Functionality

NFCBox allows users to interact with NFC chips for various purposes. You acknowledge that NFCBox is not responsible for the content or security of any data stored on the NFC chips, and you are solely responsible for ensuring that your use of the chips complies with any applicable laws and security requirements.

## 5. Security and Privacy

NFCBox takes security seriously. However, we cannot guarantee that your data is completely secure from unauthorized access. You are responsible for maintaining the security of your devices and NFC chips. NFCBox will not be liable for any loss or damage arising from unauthorized access to your account or data.

For more information on how we handle your personal data, please refer to our **Privacy Policy**.

## 6. Prohibited Activities

You agree not to use NFCBox for any illegal or unauthorized purpose, including but not limited to:
- Tampering with NFC chips you do not own.
- Using NFCBox in a manner that may damage, disable, or impair the App or its services.
- Violating any laws or regulations applicable in your jurisdiction.

## 7. Intellectual Property

All content, features, and functionality (including but not limited to text, graphics, logos, icons, and software) of the NFCBox App are owned by or licensed to NFCBox and are protected by intellectual property laws. You agree not to reproduce, distribute, or otherwise exploit any part of the App without prior written consent from NFCBox.

## 8. Limitation of Liability

NFCBox is provided on an "as is" and "as available" basis. We make no warranties or guarantees regarding the availability, accuracy, or reliability of the App. NFCBox shall not be liable for any indirect, incidental, or consequential damages arising from your use or inability to use the App.

## 9. Changes to Terms

NFCBox reserves the right to modify these Terms at any time. Any changes will be posted within the App, and your continued use of the App after such modifications constitutes your acceptance of the revised Terms.

## 10. Termination

We reserve the right to terminate or suspend your account at any time, with or without notice, for violating these Terms or for any other reason at our discretion.

## 11. Governing Law

These Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.

## 12. Contact Information

If you have any questions or concerns about these Terms, please contact us at:

**Email:** [Your Contact Email]
""")
        ],
      ),
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
          value: _isAccepted,
          onChanged: (val) => setState(() {
            _isAccepted = val ?? false;
          }),
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
