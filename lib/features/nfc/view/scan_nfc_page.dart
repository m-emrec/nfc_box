import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

import 'package:nfc_box/logger.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/tag.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../provider/providers.dart';

part '_scan_nfc_page_utils.dart';

class ScanNfcPage extends ConsumerStatefulWidget {
  final bool isWrite;
  final Tag? tag;
  const ScanNfcPage(this.isWrite, this.tag, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReadNfcPageState();
}

class _ReadNfcPageState extends ConsumerState<ScanNfcPage>
    with _ScanNfcPageUtils {
  @override
  Widget build(BuildContext context) {
    if (context.mounted) {
      stateListener(context);
    }
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(AppAssets.readingNfcAni),
            Text(
              statusText,
              style: context.textTheme.titleLarge,
            ),
            Text(
              pleaseHoldYourPhoneNearTheNFCTagText,
              style: context.textTheme.bodyMedium,
            ),
            MaxGap(AppPaddings.lPadding),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                cancelText,
                style: TextStyle(color: AppColors.accentError[70]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
