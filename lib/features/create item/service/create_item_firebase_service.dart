import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/constants/enums/collection_keys.dart';
import '../../../core/constants/enums/item_doc_keys.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/firebase_utils.dart';

final class CreateItemDatabaseService with FirebaseUtils {
  /// This method creates a new item to upload to the database.
  Future<DataState> createItem({
    required Item item,
  }) async {
    try {
      /// Upload image to firebase storage
      /// and get the download url
      ///  to store in the database
      final DataState imageState =
          await _uploadImageToFirebase(File(item.imageUrl ?? ""));

      /// If the image upload is successful,
      if (imageState is DataSuccess) {
        /// and if the image url is not null,
        if (imageState.data != null) {
          /// then update the item with the image url
          item = item.copyWith(
            imageUrl: imageState.data as String,
          );
        }
      }

      /// Update the created date of the item
      item = item.copyWith(
        createdDate: DateTime.now(),
      );
      // create a map of the item data
      final Map<String, dynamic> data = item.toMap();
      _uploadItemToDatabase(data);
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  /// This method updates an existing item in the database.
  Future<DataState> updateItem({
    required Item item,
  }) async {
    try {
      /// Upload image to firebase storage
      /// and get the download url
      ///  to store in the database
      final DataState imageState =
          await _uploadImageToFirebase(File(item.imageUrl ?? ""));

      /// If the image upload is successful,
      if (imageState is DataSuccess) {
        /// and if the image url is not null,
        if (imageState.data != null) {
          /// then update the item with the image url
          item = item.copyWith(
            imageUrl: imageState.data as String,
          );
        }
      }
      // create a map of the item data
      final Map<String, dynamic> data = item.toMap();

      final DocumentReference<Map<String, dynamic>> userDoc =
          await getUserDoc();
      await userDoc
          .collection(CollectionNames.Items.name)
          .doc(item.id)
          .update(data);

      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  /// This method uploads the item data to the database
  /// and updates the item id in the database
  Future<void> _uploadItemToDatabase(Map<String, dynamic> data) async {
    /// Get the user document reference
    final DocumentReference<Map<String, dynamic>> userDoc = await getUserDoc();

    /// Add the item data to the user document
    await userDoc.collection(CollectionNames.Items.name).add(data).then(
      (value) async {
        /// Update the item id in the database
        await value.update({ItemDocKeys.id.name: value.id});
      },
    );
  }

  /// This method uploads the image to firebase storage
  /// and returns the download url
  Future<DataState> _uploadImageToFirebase(File? imagePath) async {
    try {
      if (imagePath != null) {
        final ref = storage.ref().child('$uid/images/$imagePath');
        await ref.putFile(imagePath);
        final String url = await ref.getDownloadURL();
        return DataSuccess(url);
      } else {
        return DataSuccess(null);
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
