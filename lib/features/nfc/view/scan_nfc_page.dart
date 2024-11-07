import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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

class ScanNfcPage extends ConsumerStatefulWidget {
  final bool isWrite;
  final Tag? tag;
  const ScanNfcPage(this.isWrite, this.tag, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReadNfcPageState();
}

class _ReadNfcPageState extends ConsumerState<ScanNfcPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (context.mounted) {
      _stateListener(context);
    }

    var status = 'Scanning...';
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
              status,
              style: context.textTheme.titleLarge,
            ),
            Text(
              pleaseHoldYourPhoneNearTheNFCTag,
              style: context.textTheme.bodyMedium,
            ),
            MaxGap(AppPaddings.lPadding),
            TextButton(
              onPressed: () => context.pop(),
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

  void _stateListener(BuildContext context) {
    return ref.listen(
        NfcProviders.nfcStateProvider({
          "isWrite": widget.isWrite,
          "tag": widget.tag?.toJson(),
        }), (prev, current) {
      if (current is DataSuccess) {
        // logger.i(current.data);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Toast.succToast(title: 'NFC read successfully');
        });
        context.goNamed(
          Routes.tagDetail.name,
          extra: Tag.fromJson(current.data),
        );
      } else if (current is DataFailed) {
        logger.e(current.exception);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Toast.errToast(title: current.exception);
          context.goNamed(
            Routes.prepareNfc.name,
            extra: {
              "isWrite": widget.isWrite,
              "tag": widget.tag,
            },
          );
        });
      }
    });
  }
}
