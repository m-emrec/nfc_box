part of "scan_nfc_page.dart";

mixin _ScanNfcPageUtils on ConsumerState<ScanNfcPage> {
  final String status = 'Scanning...';
  final String pleaseHoldYourPhoneNearTheNFCTag =
      'Please hold your phone near the NFC tag';
  final String cancel = 'Cancel';

  /// This function listens the [nfcStateProvider]'s state changes
  void stateListener(BuildContext context) {
    const String nfcReadSuccessfully = 'NFC read successfully';

    return ref.listen(
        NfcProviders.nfcStateProvider({
          "isWrite": widget.isWrite,
          "tag": widget.tag?.toJson(),
        }), (prev, current) {
      if (current is DataSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Toast.succToast(title: nfcReadSuccessfully);
        });

        /// Navigate to the tag detail page
        context.goNamed(
          Routes.tagDetail.name,
          extra: Tag.fromJson(current.data),
        );
      } else if (current is DataFailed) {
        logger.e(current.exception);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Toast.errToast(title: current.exception);

          /// Navigate to the prepare NFC page again
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
