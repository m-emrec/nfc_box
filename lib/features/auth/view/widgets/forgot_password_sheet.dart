import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../model/credentials.dart';
import '../../providers/provider.dart';
import 'email_field.dart';

class ForgotPasswordSheet extends StatelessWidget {
  ForgotPasswordSheet({super.key});
  final TextEditingController _controller = TextEditingController();
  final String forgotPassword = 'Forgot Password';
  final String sendEmail = 'Send Email';
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      heightFactor: .3,
      title: forgotPassword,
      content: Padding(
        padding: AppPaddings.authHPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EmailField(
              controller: _controller,
              textInputAction: TextInputAction.done,
            ),
            MaxGap(AppPaddings.sPadding),
            Consumer(
              builder: (context, ref, child) => ResponsiveElevatedButton(
                onPressed: () => onTap(context, ref),
                child: Text(sendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTap(BuildContext context, WidgetRef ref) async {
    await ref
        .read(authServiceViewModelProvider)
        .forgotPassword(
          Credentials(email: _controller.text, password: ""),
        )
        .whenComplete(() {
      if (context.mounted) context.pop();
    });
  }
}
