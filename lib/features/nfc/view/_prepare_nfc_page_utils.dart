part of 'prepare_nfc_page.dart';

final class _PrepareNfcPageUtils {
  _PrepareNfcPageUtils._();
  static const String howToUseNFC = 'How To Use NFC';
  static const String explanation =
      """To start using NFC, hold your device near an NFC-enabled item or device. Make sure NFC is enabled in your device settings. When your device is close enough, it will automatically detect the NFC tag and process the information.

""";
  static const String ready = 'Ready';

  static void onTapReady(
      {required bool isWrite,
      required Tag? tag,
      required BuildContext context}) {
    context.goNamed(Routes.scanNfc.name, extra: {
      "isWrite": isWrite,

      /// TODO: Change the item name to the actual item name
      "tag": Tag(
        token: FirebaseAuth.instance.currentUser?.uid,
        name: tag?.name,
        items: [Item(itemName: " asdasd")],
      ),
    });
  }
}
