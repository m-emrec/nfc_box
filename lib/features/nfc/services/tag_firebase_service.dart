import 'package:firebase_database/firebase_database.dart';

import 'package:nfc_box/logger.dart';

import '../../../core/constants/enums/collection_keys.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/firebase_utils.dart';
import '../../../core/utils/models/tag.dart';

/// This class is used to interact with the Firebase database to get and upload tag data.
/// It uses the [FirebaseUtils] mixin to get the user's uid.
/// It has two functions:
/// 1. [getNfcDataFromUrl] - This function is used to get the tag data from the Firebase database.
/// 2. [uploadTagData] - This function is used to upload the tag data to the Firebase database.
final class TagFirebaseService with FirebaseUtils {
  /// This function is used to get the tag data from the Firebase database.
  /// It takes a [String] id as a parameter.
  /// It returns a [DataState] object.
  /// If the data is successfully retrieved, it returns [DataSuccess] with the Tag data.
  /// If there is an error, it returns [DataFailed] with the error message.
  Future<DataState> getNfcDataFromUrl(String id) async {
    try {
      final ref = await _getTagsPath();

      final DatabaseEvent? databaseEvent = await ref?.child(id).once();
      final tagData = databaseEvent?.snapshot.value;
      return DataSuccess(tagData);
    } catch (e) {
      logger.e(e);
      return DataFailed(e.toString());
    }
  }

  /// This function is used to upload the tag data to the Firebase database.
  /// It takes a [Tag] object as a parameter.
  /// It returns a [DataState] object.
  /// If the data is successfully uploaded, it returns [DataSuccess] with the path of the data.
  /// If there is an error, it returns [DataFailed] with the error message.
  Future<DataState> uploadTagData(Tag tag) async {
    try {
      /// Check the [uid] of the user.
      if (uid != null) {
        final ref = await _getTagsPath();

        /// Update the tag data in the database.
        await ref?.update({
          tag.id ?? "": tag.toJson(),
        });

        /// This is the path of the tag data.
        final path = "${ref!.path}/${tag.id!}";
        return DataSuccess(path);
      }
      throw "User not authenticated";
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
