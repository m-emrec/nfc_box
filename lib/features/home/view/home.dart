import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/routes/router.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/buttons_import.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final String readNFC = 'Read NFC';
  final String seeItems = 'See Items';
  static const String nfcBox = 'NFC Box';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text(nfcBox),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.authHPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.mainPageIllustration,
                fit: BoxFit.fitHeight,
                height: context.screenSize.height * .6,
              ),
              ResponsiveElevatedButton(
                onPressed: () async {
                  context.goNamed(Routes.prepareNfc.name);
                },
                child: Text(
                  readNFC,
                ),
              ),
              MaxGap(AppPaddings.sPadding),
              Row(
                children: [
                  ResponsiveOutlinedButton(
                    onPressed: () async {
                      context.goNamed(Routes.itemList.name);
                    },
                    child: Text(
                      seeItems,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
