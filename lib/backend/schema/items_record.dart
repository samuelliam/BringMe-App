import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "itemHistory" field.
  List<HistoryItemStruct>? _itemHistory;
  List<HistoryItemStruct> get itemHistory => _itemHistory ?? const [];
  bool hasItemHistory() => _itemHistory != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemName = snapshotData['itemName'] as String?;
    _itemHistory = getStructList(
      snapshotData['itemHistory'],
      HistoryItemStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('items')
          : FirebaseFirestore.instance.collectionGroup('items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('items').doc(id);

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? itemName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemName': itemName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemName == e2?.itemName &&
        listEquality.equals(e1?.itemHistory, e2?.itemHistory);
  }

  @override
  int hash(ItemsRecord? e) =>
      const ListEquality().hash([e?.itemName, e?.itemHistory]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
