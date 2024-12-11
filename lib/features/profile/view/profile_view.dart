import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/constants/colors.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/core/utils/widgets/buttons/buttons_import.dart';
import 'package:nfc_box/core/utils/widgets/custom%20bottom%20sheet/custom_bottom_sheet.dart';
import 'package:nfc_box/features/auth/view/widgets/password_field.dart';
import 'package:nfc_box/features/profile/provider/profile_provider.dart';

import '../../../core/resources/firebase_utils.dart';
part 'widgets/_profile_option_tile.dart';
part 'widgets/_change_password_bottom_sheet.dart';
part 'widgets/_are_you_sure_dialog.dart';
part 'utils/_profile_view_utils.dart';

class ProfileView extends ConsumerWidget with FirebaseUtils, _ProfileViewUtils {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(LocaleKeys.profile_profile),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Change password
          _ProfileOptionTile(
            onTap: () => showChangePasswordSheet(context),
            title: tr(LocaleKeys.profile_changePassword),
            leading: const Icon(Icons.lock),
          ),
          // Logout
          _ProfileOptionTile(
            title: tr(LocaleKeys.profile_logout),
            onTap: () async => signOut(),
            leading: const Icon(Icons.logout),
          ),
          Gap(AppPaddings.sPadding),
          Center(
            child: Text(
              tr(LocaleKeys.profile_dangerZone),
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.accentError[80],
              ),
            ),
          ),
          Divider(
            color: AppColors.accentError[60],
            indent: AppPaddings.sPadding,
            endIndent: AppPaddings.sPadding,
          ),
          _ProfileOptionTile(
            onTap: () => showRemoveItemsDialog(
              context,
              ref,
            ),
            title: tr(LocaleKeys.profile_removeItems),
            leading: Icon(
              Icons.delete_forever,
              color: AppColors.accentError[80],
            ),
            textColor: AppColors.accentError[80],
          ),
          _ProfileOptionTile(
            onTap: () => showDeleteAccountDialog(
              context,
              ref,
            ),
            title: tr(LocaleKeys.profile_deleteAccount),
            leading: Icon(
              Icons.person_remove_alt_1_rounded,
              color: AppColors.accentError[80],
            ),
            textColor: AppColors.accentError[80],
          ),
        ],
      ),
    );
  }
}
