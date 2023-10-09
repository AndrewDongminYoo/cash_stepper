// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:collection/collection.dart';

// 🌎 Project imports:
import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import 'index.dart';

class TransactionCategoriesRecord extends FirestoreRecord {
  TransactionCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "categoryName" field.
  List<String>? _categoryName;
  List<String> get categoryName => _categoryName ?? const [];
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _categoryName = getDataList(snapshotData['categoryName']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactionCategories');

  static Stream<TransactionCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(TransactionCategoriesRecord.fromSnapshot);

  static Future<TransactionCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(TransactionCategoriesRecord.fromSnapshot);

  static TransactionCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data()! as Map<String, dynamic>),
      );

  static TransactionCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTransactionCategoriesRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionCategoriesRecordDocumentEquality
    implements Equality<TransactionCategoriesRecord> {
  const TransactionCategoriesRecordDocumentEquality();

  @override
  bool equals(
      TransactionCategoriesRecord? e1, TransactionCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.categoryName, e2?.categoryName);
  }

  @override
  int hash(TransactionCategoriesRecord? e) =>
      const ListEquality().hash([e?.user, e?.categoryName]);

  @override
  bool isValidKey(Object? o) => o is TransactionCategoriesRecord;
}
