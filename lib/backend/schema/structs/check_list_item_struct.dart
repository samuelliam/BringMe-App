// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListItemStruct extends FFFirebaseStruct {
  CheckListItemStruct({
    String? itemName,
    bool? isItemBringed,
    DateTime? lastTimeUpdated,
    LatLng? lastLocation,
    List<LatLng>? locationHistory,
    List<DateTime>? timeUpdateHistory,
    String? lastLocationAddress,
    String? image,
    int? itemGroup,
    String? itemID,
    String? itemNotes,
    List<String>? itemImages,
    bool? atHome,
    List<LatLongWithAddressStruct>? locationHistoryWithAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _isItemBringed = isItemBringed,
        _lastTimeUpdated = lastTimeUpdated,
        _lastLocation = lastLocation,
        _locationHistory = locationHistory,
        _timeUpdateHistory = timeUpdateHistory,
        _lastLocationAddress = lastLocationAddress,
        _image = image,
        _itemGroup = itemGroup,
        _itemID = itemID,
        _itemNotes = itemNotes,
        _itemImages = itemImages,
        _atHome = atHome,
        _locationHistoryWithAddress = locationHistoryWithAddress,
        super(firestoreUtilData);

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;

  bool hasItemName() => _itemName != null;

  // "isItemBringed" field.
  bool? _isItemBringed;
  bool get isItemBringed => _isItemBringed ?? false;
  set isItemBringed(bool? val) => _isItemBringed = val;

  bool hasIsItemBringed() => _isItemBringed != null;

  // "lastTimeUpdated" field.
  DateTime? _lastTimeUpdated;
  DateTime? get lastTimeUpdated => _lastTimeUpdated;
  set lastTimeUpdated(DateTime? val) => _lastTimeUpdated = val;

  bool hasLastTimeUpdated() => _lastTimeUpdated != null;

  // "lastLocation" field.
  LatLng? _lastLocation;
  LatLng? get lastLocation => _lastLocation;
  set lastLocation(LatLng? val) => _lastLocation = val;

  bool hasLastLocation() => _lastLocation != null;

  // "locationHistory" field.
  List<LatLng>? _locationHistory;
  List<LatLng> get locationHistory => _locationHistory ?? const [];
  set locationHistory(List<LatLng>? val) => _locationHistory = val;

  void updateLocationHistory(Function(List<LatLng>) updateFn) {
    updateFn(_locationHistory ??= []);
  }

  bool hasLocationHistory() => _locationHistory != null;

  // "timeUpdateHistory" field.
  List<DateTime>? _timeUpdateHistory;
  List<DateTime> get timeUpdateHistory => _timeUpdateHistory ?? const [];
  set timeUpdateHistory(List<DateTime>? val) => _timeUpdateHistory = val;

  void updateTimeUpdateHistory(Function(List<DateTime>) updateFn) {
    updateFn(_timeUpdateHistory ??= []);
  }

  bool hasTimeUpdateHistory() => _timeUpdateHistory != null;

  // "lastLocationAddress" field.
  String? _lastLocationAddress;
  String get lastLocationAddress => _lastLocationAddress ?? '';
  set lastLocationAddress(String? val) => _lastLocationAddress = val;

  bool hasLastLocationAddress() => _lastLocationAddress != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "itemGroup" field.
  int? _itemGroup;
  int get itemGroup => _itemGroup ?? 0;
  set itemGroup(int? val) => _itemGroup = val;

  void incrementItemGroup(int amount) => itemGroup = itemGroup + amount;

  bool hasItemGroup() => _itemGroup != null;

  // "itemID" field.
  String? _itemID;
  String get itemID => _itemID ?? '';
  set itemID(String? val) => _itemID = val;

  bool hasItemID() => _itemID != null;

  // "itemNotes" field.
  String? _itemNotes;
  String get itemNotes => _itemNotes ?? '';
  set itemNotes(String? val) => _itemNotes = val;

  bool hasItemNotes() => _itemNotes != null;

  // "itemImages" field.
  List<String>? _itemImages;
  List<String> get itemImages => _itemImages ?? const [];
  set itemImages(List<String>? val) => _itemImages = val;

  void updateItemImages(Function(List<String>) updateFn) {
    updateFn(_itemImages ??= []);
  }

  bool hasItemImages() => _itemImages != null;

  // "atHome" field.
  bool? _atHome;
  bool get atHome => _atHome ?? false;
  set atHome(bool? val) => _atHome = val;

  bool hasAtHome() => _atHome != null;

  // "locationHistoryWithAddress" field.
  List<LatLongWithAddressStruct>? _locationHistoryWithAddress;
  List<LatLongWithAddressStruct> get locationHistoryWithAddress =>
      _locationHistoryWithAddress ?? const [];
  set locationHistoryWithAddress(List<LatLongWithAddressStruct>? val) =>
      _locationHistoryWithAddress = val;

  void updateLocationHistoryWithAddress(
      Function(List<LatLongWithAddressStruct>) updateFn) {
    updateFn(_locationHistoryWithAddress ??= []);
  }

  bool hasLocationHistoryWithAddress() => _locationHistoryWithAddress != null;

  static CheckListItemStruct fromMap(Map<String, dynamic> data) =>
      CheckListItemStruct(
        itemName: data['itemName'] as String?,
        isItemBringed: data['isItemBringed'] as bool?,
        lastTimeUpdated: data['lastTimeUpdated'] as DateTime?,
        lastLocation: data['lastLocation'] as LatLng?,
        locationHistory: getDataList(data['locationHistory']),
        timeUpdateHistory: getDataList(data['timeUpdateHistory']),
        lastLocationAddress: data['lastLocationAddress'] as String?,
        image: data['image'] as String?,
        itemGroup: castToType<int>(data['itemGroup']),
        itemID: data['itemID'] as String?,
        itemNotes: data['itemNotes'] as String?,
        itemImages: getDataList(data['itemImages']),
        atHome: data['atHome'] as bool?,
        locationHistoryWithAddress: getStructList(
          data['locationHistoryWithAddress'],
          LatLongWithAddressStruct.fromMap,
        ),
      );

  static CheckListItemStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckListItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'itemName': _itemName,
        'isItemBringed': _isItemBringed,
        'lastTimeUpdated': _lastTimeUpdated,
        'lastLocation': _lastLocation,
        'locationHistory': _locationHistory,
        'timeUpdateHistory': _timeUpdateHistory,
        'lastLocationAddress': _lastLocationAddress,
        'image': _image,
        'itemGroup': _itemGroup,
        'itemID': _itemID,
        'itemNotes': _itemNotes,
        'itemImages': _itemImages,
        'atHome': _atHome,
        'locationHistoryWithAddress':
            _locationHistoryWithAddress?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'isItemBringed': serializeParam(
          _isItemBringed,
          ParamType.bool,
        ),
        'lastTimeUpdated': serializeParam(
          _lastTimeUpdated,
          ParamType.DateTime,
        ),
        'lastLocation': serializeParam(
          _lastLocation,
          ParamType.LatLng,
        ),
        'locationHistory': serializeParam(
          _locationHistory,
          ParamType.LatLng,
          isList: true,
        ),
        'timeUpdateHistory': serializeParam(
          _timeUpdateHistory,
          ParamType.DateTime,
          isList: true,
        ),
        'lastLocationAddress': serializeParam(
          _lastLocationAddress,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'itemGroup': serializeParam(
          _itemGroup,
          ParamType.int,
        ),
        'itemID': serializeParam(
          _itemID,
          ParamType.String,
        ),
        'itemNotes': serializeParam(
          _itemNotes,
          ParamType.String,
        ),
        'itemImages': serializeParam(
          _itemImages,
          ParamType.String,
          isList: true,
        ),
        'atHome': serializeParam(
          _atHome,
          ParamType.bool,
        ),
        'locationHistoryWithAddress': serializeParam(
          _locationHistoryWithAddress,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CheckListItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckListItemStruct(
        itemName: deserializeParam(
          data['itemName'],
          ParamType.String,
          false,
        ),
        isItemBringed: deserializeParam(
          data['isItemBringed'],
          ParamType.bool,
          false,
        ),
        lastTimeUpdated: deserializeParam(
          data['lastTimeUpdated'],
          ParamType.DateTime,
          false,
        ),
        lastLocation: deserializeParam(
          data['lastLocation'],
          ParamType.LatLng,
          false,
        ),
        locationHistory: deserializeParam<LatLng>(
          data['locationHistory'],
          ParamType.LatLng,
          true,
        ),
        timeUpdateHistory: deserializeParam<DateTime>(
          data['timeUpdateHistory'],
          ParamType.DateTime,
          true,
        ),
        lastLocationAddress: deserializeParam(
          data['lastLocationAddress'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        itemGroup: deserializeParam(
          data['itemGroup'],
          ParamType.int,
          false,
        ),
        itemID: deserializeParam(
          data['itemID'],
          ParamType.String,
          false,
        ),
        itemNotes: deserializeParam(
          data['itemNotes'],
          ParamType.String,
          false,
        ),
        itemImages: deserializeParam<String>(
          data['itemImages'],
          ParamType.String,
          true,
        ),
        atHome: deserializeParam(
          data['atHome'],
          ParamType.bool,
          false,
        ),
        locationHistoryWithAddress:
            deserializeStructParam<LatLongWithAddressStruct>(
          data['locationHistoryWithAddress'],
          ParamType.DataStruct,
          true,
          structBuilder: LatLongWithAddressStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CheckListItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CheckListItemStruct &&
        itemName == other.itemName &&
        isItemBringed == other.isItemBringed &&
        lastTimeUpdated == other.lastTimeUpdated &&
        lastLocation == other.lastLocation &&
        listEquality.equals(locationHistory, other.locationHistory) &&
        listEquality.equals(timeUpdateHistory, other.timeUpdateHistory) &&
        lastLocationAddress == other.lastLocationAddress &&
        image == other.image &&
        itemGroup == other.itemGroup &&
        itemID == other.itemID &&
        itemNotes == other.itemNotes &&
        listEquality.equals(itemImages, other.itemImages) &&
        atHome == other.atHome &&
        listEquality.equals(
            locationHistoryWithAddress, other.locationHistoryWithAddress);
  }

  @override
  int get hashCode => const ListEquality().hash([
        itemName,
        isItemBringed,
        lastTimeUpdated,
        lastLocation,
        locationHistory,
        timeUpdateHistory,
        lastLocationAddress,
        image,
        itemGroup,
        itemID,
        itemNotes,
        itemImages,
        atHome,
        locationHistoryWithAddress
      ]);
}

CheckListItemStruct createCheckListItemStruct({
  String? itemName,
  bool? isItemBringed,
  DateTime? lastTimeUpdated,
  LatLng? lastLocation,
  String? lastLocationAddress,
  String? image,
  int? itemGroup,
  String? itemID,
  String? itemNotes,
  bool? atHome,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckListItemStruct(
      itemName: itemName,
      isItemBringed: isItemBringed,
      lastTimeUpdated: lastTimeUpdated,
      lastLocation: lastLocation,
      lastLocationAddress: lastLocationAddress,
      image: image,
      itemGroup: itemGroup,
      itemID: itemID,
      itemNotes: itemNotes,
      atHome: atHome,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckListItemStruct? updateCheckListItemStruct(
  CheckListItemStruct? checkListItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkListItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckListItemStructData(
  Map<String, dynamic> firestoreData,
  CheckListItemStruct? checkListItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkListItem == null) {
    return;
  }
  if (checkListItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkListItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkListItemData =
      getCheckListItemFirestoreData(checkListItem, forFieldValue);
  final nestedData =
      checkListItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkListItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckListItemFirestoreData(
  CheckListItemStruct? checkListItem, [
  bool forFieldValue = false,
]) {
  if (checkListItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkListItem.toMap());

  // Add any Firestore field values
  checkListItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckListItemListFirestoreData(
  List<CheckListItemStruct>? checkListItems,
) =>
    checkListItems
        ?.map((e) => getCheckListItemFirestoreData(e, true))
        .toList() ??
    [];
