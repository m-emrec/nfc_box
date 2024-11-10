part of 'prepare_nfc_page.dart';

final class _PrepareNfcPageUtils {
  _PrepareNfcPageUtils._();
  static const String howToUseNFCText = 'How To Use NFC';
  static const String explanationText =
      """To start using NFC, hold your device near an NFC-enabled item or device. Make sure NFC is enabled in your device settings. When your device is close enough, it will automatically detect the NFC tag and process the information.

""";
  static const String ready = 'Ready';

  static void onTapReady(
      {required bool isWrite,
      required Tag? tag,
      required BuildContext context}) {
    context.goNamed(Routes.scanNfc.name, extra: {
      "isWrite": isWrite,
      "tag": tag,
    });
  }
}
