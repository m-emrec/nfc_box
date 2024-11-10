import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/resources/data_state.dart';
import '../services/nfc_service.dart';

final class NfcProviders {
  static final _nfcProvider =
      StateNotifierProvider.autoDispose<NfcNotifier, DataState?>((ref) {
    return NfcNotifier();
  });

  static final nfcStateProvider =
      StateProvider.autoDispose.family<DataState?, Map>((ref, data) {
    DataState? dataState;

    /// Check if the data is for writing or reading
    if (data["isWrite"]) {
      ref.read(_nfcProvider.notifier).writeNfc(data["tag"]);
      dataState = ref.watch(_nfcProvider);
    } else {
      ref.read(_nfcProvider.notifier).readNfc();
      dataState = ref.watch(_nfcProvider);
    }

    return dataState;
  });
}
