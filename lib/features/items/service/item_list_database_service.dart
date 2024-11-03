import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_box/logger.dart';
import '../../../core/constants/enums/collection_keys.dart';
import '../../../core/resources/data_state.dart';

import '../../../core/resources/firebase_utils.dart';
import '../../../core/utils/models/item.dart';

final class ItemListDatabaseService extends FirebaseUtils {
  Future<DataState> fetchItems() async {
    // Fetch items from the database
    try {
      final List<QueryDocumentSnapshot> itemList = await _getItemDocs();
      logger.i(itemList.length);

      return DataSuccess(itemList);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<DataState> removeItem(Item item) async {
    // Fetch items from the database
    try {
      final DocumentReference<Map<String, dynamic>> userDoc =
          await getUserDoc();
      await userDoc
          .collection(CollectionNames.Items.name)
          .doc(item.id)
          .delete();
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<List<QueryDocumentSnapshot>> _getItemDocs() async {
    final DocumentReference<Map<String, dynamic>> userDoc = await getUserDoc();
    final Query<Map<String, dynamic>> collection = userDoc
        .collection(CollectionNames.Items.name)
        .orderBy('createdDate', descending: true);

    // // userDoc.collection("collectionPath").doc("").delete();
    final List<QueryDocumentSnapshot> docs =
        await collection.get().then((value) => value.docs);

    return docs;
  }
}
