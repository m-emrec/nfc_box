import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nfc_box/core/constants/enums/collection_keys.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/resources/firebase_utils.dart';
import 'package:nfc_box/logger.dart';

class ProfileFirebaseService with FirebaseUtils {
  Future<DataState> changePassword(String newPassword) async {
    try {
      await auth.currentUser?.updatePassword(newPassword);
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> deleteAccount() async {
    try {
      await removeItems();
      await auth.currentUser?.delete();
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }

  Future<DataState> removeItems() async {
    try {
      final userDoc = await getUserDoc();
      await userDoc
          .collection(CollectionNames.Items.name)
          .get()
          .then((snapshot) {
        for (DocumentSnapshot doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      final ref = storage.ref().child('$uid/images');

      await _deleteFolder(ref.fullPath);
      return DataSuccess(null);
    } catch (e) {
      logger.e(e);
      return DataFailed(e);
    }
  }

  Future<void> _deleteFolder(String folderPath) async {
    final storageRef = storage.ref(folderPath);

    // List all items in the folder
    final ListResult result = await storageRef.listAll();

    // Delete all files
    for (var fileRef in result.items) {
      await fileRef.delete();
    }

    // Recursively delete subfolders
    for (var folderRef in result.prefixes) {
      await _deleteFolder(folderRef.fullPath);
    }
  }
}
