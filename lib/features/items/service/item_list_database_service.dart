import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/enums/collection_keys.dart';
import '../../../core/resources/data_state.dart';

import '../../../core/resources/firebase_utils.dart';

final class ItemListDatabaseService extends FirebaseUtils {
  Future<DataState> fetchItems() async {
    // Fetch items from the database
    try {
      final List<QueryDocumentSnapshot> itemList = await _getItemDocs();
      return DataSuccess(itemList);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<List<QueryDocumentSnapshot>> _getItemDocs() async {
    final DocumentReference<Map<String, dynamic>> userDoc = await getUserDoc();
    final Query<Map<String, dynamic>> collection = userDoc
        .collection(CollectionNames.Items.name)
        .orderBy('createdDate', descending: true);

    final List<QueryDocumentSnapshot> docs =
        await collection.get().then((value) => value.docs);

    return docs;
  }
}
