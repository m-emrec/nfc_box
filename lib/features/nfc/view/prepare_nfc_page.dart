import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/models/tag.dart';
import '../../../core/utils/widgets/buttons/buttons_import.dart';

class PrepareNfcPage extends StatelessWidget {
  final bool isWrite;
  final Tag? tag;
  const PrepareNfcPage({super.key, required this.isWrite, this.tag});

  @override
  Widget build(BuildContext context) {
    var howToUseNFC = 'How To Use NFC';
    var explanation =
        """To start using NFC, hold your device near an NFC-enabled item or device. Make sure NFC is enabled in your device settings. When your device is close enough, it will automatically detect the NFC tag and process the information.

""";
    var ready = 'Ready';
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPaddings.authHPadding +
            EdgeInsets.only(bottom: AppPaddings.sPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Lottie.asset(
                AppAssets.howToReadNfcAni,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                height: context.screenSize.height * 0.4,
                width: context.screenSize.width,
              ),
            ),
            const Spacer(),
            Text(
              howToUseNFC,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.left,
            ),
            Gap(AppPaddings.xxsPadding),
            Text(
              explanation,
              style: context.textTheme.bodyMedium,
            ),
            const Spacer(),
            ResponsiveElevatedButton(
              onPressed: () async => context.goNamed(Routes.scanNfc.name,
                  extra: {"isWrite": isWrite, "tag": tag}),
              child: Text(ready),
            ),
          ],
        ),
      ),
    );
  }
}
