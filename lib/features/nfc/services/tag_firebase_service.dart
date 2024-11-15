import 'package:firebase_database/firebase_database.dart';
import 'package:nfc_box/core/constants/enums/collection_keys.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/resources/firebase_utils.dart';
import 'package:nfc_box/logger.dart';

import '../../../core/utils/models/tag.dart';

final class TagFirebaseService with FirebaseUtils {
  Future<DataState> getNfcDataFromUrl(String id) async {
    try {
      final ref = await _getTagsPath();

      final DatabaseEvent? data = await ref?.child(id).once();
      logger.i(data?.snapshot.value);
      return DataSuccess(data?.snapshot.value);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  Future<DataState> uploadTagData(Tag tag) async {
    try {
      if (uid != null) {
        final ref = await _getTagsPath();
        await ref?.update({
          tag.id ?? "": tag.toJson(),
        });
        logger.i(ref?.path);
        final path = "${ref!.path}/${tag.id!}";
        return DataSuccess(path);
      }
      throw Exception("User not authenticated");
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  /// This function is used to get the tags path.
  Future<DatabaseReference?> _getTagsPath() async {
    try {
      if (uid != null) {
        return rtd.child(CollectionNames.Users.name).child(uid!).child("Tags");
      }
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
