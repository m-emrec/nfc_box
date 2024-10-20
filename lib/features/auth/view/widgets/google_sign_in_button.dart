import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_box/features/auth/providers/provider.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ResponsiveOutlinedButton(
          style: context.theme.outlinedButtonTheme.style?.copyWith(
            padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          ),
          child: Lottie.asset(
            AppAssets.googleAni,
            repeat: false,
          ),
          onPressed: () =>
              ref.read(authServiceViewModelProvider).googleSignIn(),
        ),
      ],
    );
  }
}
