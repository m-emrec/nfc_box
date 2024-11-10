import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/resources/data_state.dart';
import '../view model/nfc_view_model.dart';

final class NfcProviders {
  static final _nfcProvider =
      StateNotifierProvider.autoDispose<NfcViewModel, DataState?>((ref) {
    return NfcViewModel();
  });

  static final nfcStateProvider =
      StateProvider.autoDispose.family<DataState?, Map>((ref, data) {
    DataState? dataState;
    // Check if the data is for writing or reading
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
