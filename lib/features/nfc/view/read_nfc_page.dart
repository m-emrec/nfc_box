import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/core/utils/widgets/buttons/buttons_import.dart';
import 'package:nfc_box/core/utils/widgets/buttons/inline_text_button.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/colors.dart';

class ReadNfcPage extends ConsumerStatefulWidget {
  const ReadNfcPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReadNfcPageState();
}

class _ReadNfcPageState extends ConsumerState<ReadNfcPage> {
  @override
  Widget build(BuildContext context) {
    var reading = 'Reading...';
    var pleaseHoldYourPhoneNearTheNFCTag =
        'Please hold your phone near the NFC tag';
    var cancel = 'Cancel';
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
              reading,
              style: context.textTheme.titleLarge,
            ),
            Text(
              pleaseHoldYourPhoneNearTheNFCTag,
              style: context.textTheme.bodyMedium,
            ),
            MaxGap(AppPaddings.lPadding),
            TextButton(
              onPressed: () => context.go("/"),
              child: Text(
                cancel,
                style: TextStyle(color: AppColors.accentError[70]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
