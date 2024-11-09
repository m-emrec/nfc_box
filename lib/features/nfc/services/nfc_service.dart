import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/resources/firebase_utils.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/tag.dart';
import '../../../logger.dart';

class NfcNotifier extends StateNotifier<DataState?> with FirebaseUtils {
  NfcNotifier() : super(null);
  static const Duration _timeOutDuration = Duration(seconds: 5);

  /// Check if NFC is available on the device.
  Future<bool> _isAvailable() async => await NfcManager.instance.isAvailable();

  /// I use this function to simulate a timeout.Because the NFC manager package
  ///  does not have a timeout feature.
  Future<void> _timeOut() => Future.microtask(() async {
        await Future.delayed(_timeOutDuration);

        await NfcManager.instance.stopSession();
        if (mounted) {
          state = DataFailed('Timeout reading NFC');
        }
      });

  Future<void> readNfc() async {
    //  TODO : Check Tag's token , if it is not equal to the user's uid, return error.
    String? data;
    try {
      //first check if NFC is available on the device.
      if (await _isAvailable()) {
        _timeOut();

        /// Start an NFC session to read NFC tags.
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            /// The data is stored in the payload of the tag.
            /// The payload is a list of integers.
            /// I convert the list of integers to a string.
            final Iterable<int> charCodes =
                tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];

            /// I use 3 as the starting index because the first 3 bytes are locale and " ".
            data = String.fromCharCodes(charCodes, 3);
            NfcManager.instance.stopSession();
            state = DataSuccess(data);
          },
        );
      } else {
        logger.e('NFC not available.');
        state = DataFailed('NFC not available.');
      }
    } catch (e) {
      state = DataFailed('Error reading NFC: $e');
    }
  }

  Future<void> writeNfc(Tag? tagItem) async {
    String? data;
    try {
      //first check if NFC is available on the device.
      //  TODO : Check Tag's token , if it is not equal to the user's uid, return error.
      // TODO : if there is no token , add a token to the tag.
      // TODO : if there is a token, check if the token is equal to the user's uid.
      if (await _isAvailable()) {
        _timeOut();
        NfcManager.instance.startSession(
          onDiscovered: (tag) async {
            /// I convert the tagItem to a json string.
            data = tagItem?.toJson();

            /// if data is not null
            if (data != null) {
              /// create an [NdefMessage] with the data.
              ///? I forced the [data] to be non-nullable because it is checked above. So it can't be null.
              NdefMessage message = NdefMessage([
                NdefRecord.createText(
                  data!,
                )
              ]);

              ///  write the message to the tag.
              await Ndef.from(tag)?.write(
                message,
              );
              state = DataSuccess(data);
            } else {
              state = DataFailed('Error writing NFC: $data');
            }

            await NfcManager.instance.stopSession();
          },
        );
      }
    } catch (e) {
      logger.e('Error writing NFC: $e');
      state = DataFailed(e);
    }
  }
}
