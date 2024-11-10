import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/resources/firebase_utils.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/tag.dart';
import '../../../logger.dart';

class NfcNotifier extends StateNotifier<DataState?> with FirebaseUtils {
  NfcNotifier() : super(null);

  /// Check if NFC is available on the device.
  Future<bool> _isAvailable() async => await NfcManager.instance.isAvailable();

  /// I use this function to simulate a timeout.Because the NFC manager package
  ///  does not have a timeout feature.
  Future<void> _timeOut() => Future.microtask(() async {
        const Duration timeOutDuration = Duration(seconds: 5);
        await Future.delayed(timeOutDuration);

        await NfcManager.instance.stopSession();
        if (mounted) {
          state = DataFailed('Timeout reading NFC');
        }
      });

  Future<void> readNfc() async {
    String? data;

    //first check if NFC is available on the device.
    if (await _isAvailable()) {
      _timeOut();

      /// Start an NFC session to read NFC tags.
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        try {
          /// The data is stored in the payload of the tag.
          /// The payload is a list of integers.
          /// I convert the list of integers to a string.

          final Iterable<int> charCodes =
              tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];

          /// I use 3 as the starting index because the first 3 bytes are locale and " ".
          data = String.fromCharCodes(charCodes, 3);
          if (data != null) {
            Tag tagItem = Tag.fromJson(data!);

            final _TagAuthorization tagAuthorization = _checkTagToken(tagItem);
            if (tagAuthorization == _TagAuthorization.authorized) {
              state = DataSuccess(tagItem);
            } else {
              throw "'Unauthorized tag";
            }
          } else {
            throw 'Error reading NFC: $data';
          }
          NfcManager.instance.stopSession();
        } catch (e) {
          state = DataFailed('Error reading NFC: $e');
        }
      });
    } else {
      state = DataFailed('NFC not available.');
    }
  }

  Future<void> writeNfc(Tag tagItem) async {
    String? data;
    //first check if NFC is available on the device.
    if (await _isAvailable()) {
      NfcManager.instance.startSession(onDiscovered: (tag) async {
        try {
          /// I convert the tagItem to a json string.
          data = tagItem.toJson();
          _TagAuthorization tagAuthorization = _checkTagToken(tagItem);
          if (tagAuthorization == _TagAuthorization.unauthorized) {
            throw 'Unauthorized tag';
          } else {
            /// if data is not null
            if (data != null) {
              /// create an [NdefMessage] with the data.
              ///! I forced the [data] to be non-nullable because it is checked above. So it can't be null.
              NdefMessage message = NdefMessage([
                NdefRecord.createText(
                  data!,
                )
              ]);

              ///  write the message to the tag.
              await Ndef.from(tag)?.write(
                message,
              );
              state = DataSuccess(Tag.fromJson(data!));
            } else {
              throw 'Error writing NFC: $data';
            }
          }
        } catch (e) {
          logger.e('Error writing NFC: $e');
          state = DataFailed(e);
        }
        await NfcManager.instance.stopSession();
      });
    }
  }

  _TagAuthorization _checkTagToken(Tag tag) {
    _timeOut();
    logger.i(tag);
    if (tag.token == null) {
      return _TagAuthorization.none;
    }
    if (tag.token == uid) {
      return _TagAuthorization.authorized;
    } else {
      return _TagAuthorization.unauthorized;
    }
  }
}

/// This enum is used to check the authorization type of the tag.
enum _TagAuthorization {
  /// This tag is authorized to the user.
  /// So user can read or write this tag.
  authorized,

  /// This tag is not authorized to the user.
  /// So user can't read or write this tag.
  unauthorized,

  /// This tag has no authorization. It is not assigned to any user.
  /// So this tag is new and can be assigned to the user.
  none,
}
