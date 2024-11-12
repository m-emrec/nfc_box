import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_box/core/resources/firebase_utils.dart';

import '../../../core/constants/enums/collection_keys.dart';
import '../../../core/constants/enums/item_doc_keys.dart';
import '../../../core/resources/data_state.dart';

final class FetchItemsFromDatababaseService with FirebaseUtils {
  // Fetch items from the database
  Future<DataState> fetchItems() async {
    try {
      final DocumentReference<Map<String, dynamic>> userDoc =
          await getUserDoc();
      final Query<Map<String, dynamic>> collection = userDoc
          .collection(CollectionNames.Items.name)
          .orderBy(ItemDocKeys.createdDate.name, descending: true);

      final List<QueryDocumentSnapshot> itemList =
          await collection.get().then((value) => value.docs);
      return DataSuccess(itemList);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
