import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/utils/models/item.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/tag.dart';
import '../../../logger.dart';

class NfcNotifier extends StateNotifier<DataState?> {
  NfcNotifier() : super(null);
  Future<bool> _isAvailable() async => await NfcManager.instance.isAvailable();
  static const Duration _timeOutDuration = Duration(seconds: 5);

  /// I use this function to simulate a timeout.Because the NFC plugin does not have a timeout feature.
  Future<void> _timeOut() => Future.microtask(() async {
        await Future.delayed(_timeOutDuration);

        await NfcManager.instance.stopSession();
        if (mounted) {
          state = DataFailed('Timeout reading NFC');
        }
      });

  Future<void> readNfc() async {
    String? data;
    try {
      //first check if NFC is available on the device.
      if (await _isAvailable()) {
        _timeOut();

        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            // Process NFC tag, When an NFC tag is discovered, print its data to the console.
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
      if (await _isAvailable()) {
        _timeOut();
        NfcManager.instance.startSession(
          onDiscovered: (tag) async {
            data = tagItem?.toJson();
            if (data != null) {
              NdefMessage message = NdefMessage([
                NdefRecord.createText(
                  data ?? " nope ",
                )
              ]);
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
