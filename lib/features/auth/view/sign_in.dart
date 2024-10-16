import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/core/constants/app_assets.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/features/auth/view/widgets/email_field.dart';
import 'package:nfc_box/features/auth/view/widgets/password_field.dart';

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
      appBar: AppBar(),
      body: Padding(
        padding: AppPaddings.authHPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logoPath),
            Row(),
            EmailField(
              controller: emailController,
            ),
            const Gap(32),
            PasswordField(
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
