import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';

import '../../../../core/constants/colors.dart';

/// This divider used on SignIn and SignUp pages
class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    AppColors.accentOrange[0]!,
                    AppColors.accentOrange[60]!,
                  ],
                ).createShader(bounds);
              },
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ),
        Gap(AppPaddings.xxsPadding),
        const Text("or"),
        Gap(AppPaddings.xxsPadding),
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    AppColors.accentOrange[60]!,
                    AppColors.accentOrange[0]!,
                  ],
                ).createShader(bounds);
              },
              child: Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
