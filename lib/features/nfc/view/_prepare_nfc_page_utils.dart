part of 'prepare_nfc_page.dart';

final class _PrepareNfcPageUtils {
  _PrepareNfcPageUtils._();
  static final String howToUseNFCText = tr(LocaleKeys.nfc_howToUseNFCText);
  static final String explanationText = tr(LocaleKeys.nfc_prepareNfcText);
  static final String ready = tr(LocaleKeys.nfc_ready);

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
