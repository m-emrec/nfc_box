import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/firebase_utils.dart';
import '../../../core/utils/models/tag.dart';
import '../../../logger.dart';
part '_tag_authorization_enum.dart';
part '_nfc_errors_enum.dart';

class NfcViewModel extends StateNotifier<DataState?> with FirebaseUtils {
  NfcViewModel() : super(null);

  /// Check if NFC is available on the device.
  Future<bool> _isAvailable() async => await NfcManager.instance.isAvailable();

  /// I use this function to simulate a timeout.Because the NFC manager package
  ///  does not have a timeout feature.
  Future<void> _timeOut() => Future.microtask(() async {
        const Duration timeOutDuration = Duration(seconds: 5);
        await Future.delayed(timeOutDuration);

        await NfcManager.instance.stopSession();
        if (mounted) {
          state = DataFailed(_NfcErrors.timeOut.message);
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
          final Iterable<int> charCodes =
              tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];

          /// Here I convert the list of integers to a string.
          /// I use 3 as the starting index because the first 3 bytes are locale code (en) and " ".
          data = String.fromCharCodes(charCodes, 3);
          if (data != null) {
            ///! I forced the [data] to be non-nullable because it is checked above.
            ///!So it can't be null.
            Tag tagItem = Tag.fromJson(data!);

            final _TagAuthorization tagAuthorization = _checkTagToken(tagItem);
            if (tagAuthorization == _TagAuthorization.authorized) {
              state = DataSuccess(tagItem);
            } else {
              throw _NfcErrors.unAuthorized.message;
            }
          } else {
            // If data is null, throw an unknown error.
            throw _NfcErrors.unknown.message;
          }
        } catch (e) {
          state = DataFailed(_NfcErrors.unknown.message);
        }
        NfcManager.instance.stopSession();
      });
    } else {
      state = DataFailed(_NfcErrors.unAvailable.message);
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
            throw _NfcErrors.unAuthorized.message;
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
              // If data is null, throw an unknown error.

              throw _NfcErrors.unknown.message;
            }
          }
        } catch (e) {
          logger.e('Error writing NFC: $e');
          state = DataFailed(_NfcErrors.unknown.message);
        }
        await NfcManager.instance.stopSession();
      });
    }
  }

  /// This function checks the authorization of the tag.
  _TagAuthorization _checkTagToken(Tag tag) {
    // Start timeout
    _timeOut();
    //? if the tag token is null,
    //?it means the tag is new and can be assigned to the user.
    if (tag.token == null) {
      return _TagAuthorization.none;
    }
    //? if the tag token is equal to the user id,
    //? it means the tag is authorized to the user.
    //? So user can read or write this tag.
    if (tag.token == uid) {
      return _TagAuthorization.authorized;
    } else {
      return _TagAuthorization.unauthorized;
    }
  }
}
