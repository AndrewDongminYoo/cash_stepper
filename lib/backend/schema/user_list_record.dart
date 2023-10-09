// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:collection/collection.dart';

// 🌎 Project imports:
import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import 'index.dart';

class UserListRecord extends FirestoreRecord {
  UserListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userName" field.
  DocumentReference? _userName;
  DocumentReference? get userName => _userName;
  bool hasUserName() => _userName != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userList');

  static Stream<UserListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(UserListRecord.fromSnapshot);

  static Future<UserListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(UserListRecord.fromSnapshot);

  static UserListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data()! as Map<String, dynamic>),
      );

  static UserListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserListRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUserListRecordData({
  DocumentReference? userName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserListRecordDocumentEquality implements Equality<UserListRecord> {
  const UserListRecordDocumentEquality();

  @override
  bool equals(UserListRecord? e1, UserListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userName == e2?.userName &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(UserListRecord? e) =>
      const ListEquality().hash([e?.userName, e?.users]);

  @override
  bool isValidKey(Object? o) => o is UserListRecord;
}
