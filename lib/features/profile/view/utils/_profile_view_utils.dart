part of '../profile_view.dart';

mixin _ProfileViewUtils {
  void showChangePasswordSheet(
    BuildContext context,
  ) {
    CustomBottomSheet.show(
      context,
      widget: _ChangePasswordBottomSheet(),
    );
  }

  void showDeleteAccountDialog(
    BuildContext context,
    WidgetRef ref,
  ) {
    showDialog(
      context: context,
      builder: (context) => _AreYouSureDialog(
        title: tr(LocaleKeys.profile_deleteAccount),
        content: tr(LocaleKeys.profile_deleteAccountText),
        onConfirm: () => ProfileProvider.deleteAccount(ref),
      ),
    );
  }

  void showRemoveItemsDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => _AreYouSureDialog(
          title: tr(LocaleKeys.profile_removeItems),
          content: tr(LocaleKeys.profile_removeItemsText),
          onConfirm: () async {
            context.pop();
            await ProfileProvider.removeItems(ref);
          }),
    );
  }
}
