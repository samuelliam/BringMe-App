import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LostAndFoundCollectionRecord extends FirestoreRecord {
  LostAndFoundCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "itemID" field.
  int? _itemID;
  int get itemID => _itemID ?? 0;
  bool hasItemID() => _itemID != null;

  // "isLost" field.
  bool? _isLost;
  bool get isLost => _isLost ?? false;
  bool hasIsLost() => _isLost != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "locationFound" field.
  LatLng? _locationFound;
  LatLng? get locationFound => _locationFound;
  bool hasLocationFound() => _locationFound != null;

  // "findersFee" field.
  double? _findersFee;
  double get findersFee => _findersFee ?? 0.0;
  bool hasFindersFee() => _findersFee != null;

  void _initializeFields() {
    _itemName = snapshotData['itemName'] as String?;
    _itemID = castToType<int>(snapshotData['itemID']);
    _isLost = snapshotData['isLost'] as bool?;
    _userID = snapshotData['userID'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _locationFound = snapshotData['locationFound'] as LatLng?;
    _findersFee = castToType<double>(snapshotData['findersFee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lost_and_found_collection');

  static Stream<LostAndFoundCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => LostAndFoundCollectionRecord.fromSnapshot(s));

  static Future<LostAndFoundCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LostAndFoundCollectionRecord.fromSnapshot(s));

  static LostAndFoundCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LostAndFoundCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LostAndFoundCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LostAndFoundCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LostAndFoundCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LostAndFoundCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLostAndFoundCollectionRecordData({
  String? itemName,
  int? itemID,
  bool? isLost,
  String? userID,
  DateTime? date,
  String? description,
  LatLng? locationFound,
  double? findersFee,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemName': itemName,
      'itemID': itemID,
      'isLost': isLost,
      'userID': userID,
      'date': date,
      'description': description,
      'locationFound': locationFound,
      'findersFee': findersFee,
    }.withoutNulls,
  );

  return firestoreData;
}

class LostAndFoundCollectionRecordDocumentEquality
    implements Equality<LostAndFoundCollectionRecord> {
  const LostAndFoundCollectionRecordDocumentEquality();

  @override
  bool equals(
      LostAndFoundCollectionRecord? e1, LostAndFoundCollectionRecord? e2) {
    return e1?.itemName == e2?.itemName &&
        e1?.itemID == e2?.itemID &&
        e1?.isLost == e2?.isLost &&
        e1?.userID == e2?.userID &&
        e1?.date == e2?.date &&
        e1?.description == e2?.description &&
        e1?.locationFound == e2?.locationFound &&
        e1?.findersFee == e2?.findersFee;
  }

  @override
  int hash(LostAndFoundCollectionRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.itemID,
        e?.isLost,
        e?.userID,
        e?.date,
        e?.description,
        e?.locationFound,
        e?.findersFee
      ]);

  @override
  bool isValidKey(Object? o) => o is LostAndFoundCollectionRecord;
}
