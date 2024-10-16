import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );
  }
}
