part of '../profile_view.dart';

class _ChangePasswordBottomSheet extends ConsumerWidget {
  _ChangePasswordBottomSheet();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomSheet(
      // title: tr(LocaleKeys.profile_changePassword),
      content: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPaddings.mPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PasswordField(controller: _controller),
              Gap(
                AppPaddings.mPadding,
              ),
              ResponsiveElevatedButton(
                onPressed: () async =>
                    await ProfileProvider.changePassword(ref, _controller.text),
                child: Text(
                  tr(LocaleKeys.profile_changePassword),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
