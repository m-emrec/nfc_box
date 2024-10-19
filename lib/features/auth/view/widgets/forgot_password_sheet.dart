import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../../core/utils/widgets/custom_bottom_sheet.dart';
import 'email_field.dart';

class ForgotPasswordSheet extends StatelessWidget {
  ForgotPasswordSheet({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var forgotPassword = 'Forgot Password';
    var sendEmail = 'Send Email';
    return CustomBottomSheet(
      heightFactor: .3,
      title: forgotPassword,
      content: Padding(
        padding: AppPaddings.authHPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EmailField(
              controller: _controller,
              textInputAction: TextInputAction.done,
            ),
            ResponsiveElevatedButton(
              onPressed: () {},
              child: Text(sendEmail),
            ),
          ],
        ),
      ),
    );
  }
}
