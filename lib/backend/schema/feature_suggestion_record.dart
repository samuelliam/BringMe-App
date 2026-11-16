import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureSuggestionRecord extends FirestoreRecord {
  FeatureSuggestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "suggestion" field.
  String? _suggestion;
  String get suggestion => _suggestion ?? '';
  bool hasSuggestion() => _suggestion != null;

  // "device" field.
  String? _device;
  String get device => _device ?? '';
  bool hasDevice() => _device != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _suggestion = snapshotData['suggestion'] as String?;
    _device = snapshotData['device'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('featureSuggestion');

  static Stream<FeatureSuggestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeatureSuggestionRecord.fromSnapshot(s));

  static Future<FeatureSuggestionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeatureSuggestionRecord.fromSnapshot(s));

  static FeatureSuggestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeatureSuggestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeatureSuggestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeatureSuggestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeatureSuggestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeatureSuggestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeatureSuggestionRecordData({
  String? email,
  String? suggestion,
  String? device,
  DateTime? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'suggestion': suggestion,
      'device': device,
      'dateTime': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeatureSuggestionRecordDocumentEquality
    implements Equality<FeatureSuggestionRecord> {
  const FeatureSuggestionRecordDocumentEquality();

  @override
  bool equals(FeatureSuggestionRecord? e1, FeatureSuggestionRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.suggestion == e2?.suggestion &&
        e1?.device == e2?.device &&
        e1?.dateTime == e2?.dateTime;
  }

  @override
  int hash(FeatureSuggestionRecord? e) => const ListEquality()
      .hash([e?.email, e?.suggestion, e?.device, e?.dateTime]);

  @override
  bool isValidKey(Object? o) => o is FeatureSuggestionRecord;
}
