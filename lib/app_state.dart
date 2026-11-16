import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _checklistItems = prefs
              .getStringList('ff_checklistItems')
              ?.map((x) {
                try {
                  return CheckListItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _checklistItems;
    });
    _safeInit(() {
      _jokes = prefs.getStringList('ff_jokes') ?? _jokes;
    });
    _safeInit(() {
      _colorTheme = prefs.getInt('ff_colorTheme') ?? _colorTheme;
    });
    _safeInit(() {
      _isCompactMode = prefs.getBool('ff_isCompactMode') ?? _isCompactMode;
    });
    _safeInit(() {
      _isFirstTimeOpen =
          prefs.getBool('ff_isFirstTimeOpen') ?? _isFirstTimeOpen;
    });
    _safeInit(() {
      _isNotificationOn =
          prefs.getBool('ff_isNotificationOn') ?? _isNotificationOn;
    });
    _safeInit(() {
      _notificationInterval =
          prefs.getInt('ff_notificationInterval') ?? _notificationInterval;
    });
    _safeInit(() {
      _currentItemGroup =
          prefs.getInt('ff_currentItemGroup') ?? _currentItemGroup;
    });
    _safeInit(() {
      _itemGroups = prefs
              .getStringList('ff_itemGroups')
              ?.map((x) {
                try {
                  return ItemGroupStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _itemGroups;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CheckListItemStruct> _checklistItems = [
    CheckListItemStruct.fromSerializableMap(jsonDecode(
        '{\"itemName\":\"Wallet\",\"isItemBringed\":\"false\",\"lastLocation\":\"0,0\",\"locationHistory\":\"[\\\"0,0\\\"]\",\"timeUpdateHistory\":\"[\\\"1691643001513\\\"]\",\"lastLocationAddress\":\"Hello World\",\"image\":\"https://picsum.photos/seed/407/600\",\"itemGroup\":\"0\"}'))
  ];
  List<CheckListItemStruct> get checklistItems => _checklistItems;
  set checklistItems(List<CheckListItemStruct> value) {
    _checklistItems = value;
    prefs.setStringList(
        'ff_checklistItems', value.map((x) => x.serialize()).toList());
  }

  void addToChecklistItems(CheckListItemStruct value) {
    checklistItems.add(value);
    prefs.setStringList('ff_checklistItems',
        _checklistItems.map((x) => x.serialize()).toList());
  }

  void removeFromChecklistItems(CheckListItemStruct value) {
    checklistItems.remove(value);
    prefs.setStringList('ff_checklistItems',
        _checklistItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChecklistItems(int index) {
    checklistItems.removeAt(index);
    prefs.setStringList('ff_checklistItems',
        _checklistItems.map((x) => x.serialize()).toList());
  }

  void updateChecklistItemsAtIndex(
    int index,
    CheckListItemStruct Function(CheckListItemStruct) updateFn,
  ) {
    checklistItems[index] = updateFn(_checklistItems[index]);
    prefs.setStringList('ff_checklistItems',
        _checklistItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChecklistItems(int index, CheckListItemStruct value) {
    checklistItems.insert(index, value);
    prefs.setStringList('ff_checklistItems',
        _checklistItems.map((x) => x.serialize()).toList());
  }

  List<String> _jokes = [
    'Indonesia consists only of islands - 13,667 total',
    'During World War II, the very first bomb dropped on Berlin by the Allies killed the only elephant in the Berlin Zoo',
    'People who ride on roller coasters have a higher chance of having a blood clot in the brain',
    'The tallest freestanding sculpture in the world is Chief Crazy Horse in South Dakota, USA',
    'The speed of light is generally rounded down to 186,000 miles per second. In exact terms it is 299,792,458 m/s.',
    'It takes 8 minutes 17 seconds for light to travel from the Sun’s surface to the Earth.',
    'Every second around 100 lightning bolts strike the Earth.',
    'In October 1999 an Iceberg the size of London broke free from the Antarctic ice shelf.',
    'If you could drive your car straight up you would arrive in space in just over an hour.',
    'Female black widow spiders eat their males after mating.',
    'The tallest tree ever was an Australian eucalyptus – In 1872 it was measured at 435 feet tall.',
    'August has the highest percentage of births.',
    'unless food is mixed with saliva you can\'t taste it.',
    'a bear has 42 teeth.',
    'an ostrich\'s eye is bigger than its brain',
    'lemons contain more sugar than strawberries',
    '8% of people have an extra rib',
    '85% of plant life is found in the ocean',
    'Ralph Lauren\'s original name was Ralph Lifshitz',
    'rabbits like licorice',
    'the Hawaiian alphabet has 13 letters',
    '\'Topolino\' is the name for Mickey Mouse Italy',
    'a lobsters blood is colorless but when exposed to oxygen it turns blue',
    'armadillos have 4 babies at a time and are all the same sex',
    'reindeer like bananas',
    'the longest recorded flight of a chicken was 13 seconds',
    'birds need gravity to swallow',
    'the most commonly used letter in the alphabet is E',
    'the 3 most common languages in the world are Mandarin Chinese, Spanish and English',
    'dreamt is the only word that ends in mt',
    'the first letters of the months July through to November spell JASON',
    'a cat has 32 muscles in each ear',
    'Perth is Australia\'s windiest city',
    'Elvis\'s middle name was Aron',
    'goldfish can see both infrared and ultraviolet light',
    'the smallest bones in the human body are found in your ear',
    'cats spend 66% of their life asleep',
    'Switzerland eats the most chocolate equating to 10 kilos per person per year',
    'money is the number one thing that couples argue about',
    'macadamia nuts are toxic to dogs',
    'when lightning strikes it can reach up to 30,000 degrees celsius (54,000 degrees fahrenheit)',
    'spiders are arachnids and not insects',
    'each time you see a full moon you always see the same side',
    'stewardesses is the longest word that is typed with only the left hand',
    'honey is the only natural food which never spoils',
    'M&M\'s chocolate stands for the initials for its inventors Mars and Murrie',
    'that you burn more calories eating celery than it contains (the more you eat the thinner you become)',
    'the only continent with no active volcanoes is Australia',
    'the longest street in the world is Yonge street in Toronto Canada measuring 1,896 km (1,178 miles)',
    'about 90% of the worlds population kisses',
    'Coca-Cola originally contained cocaine',
    'the Internet was originally called ARPANet (Advanced Research Projects Agency Network) designed by the US department of defense',
    'toilets use 35% of indoor water use',
    'the fortune cookie was invented in San Francisco',
    'Koalas sleep around 18 hours a day',
    'the first Burger King was opened in Florida Miami in 1954',
    'the croissant was invented in Austria',
    'In eastern Africa you can buy beer brewed from bananas',
    'African Grey Parrots have vocabularies of over 200 words',
    'a giraffe can clean its ears with its 21 inch tongue'
  ];
  List<String> get jokes => _jokes;
  set jokes(List<String> value) {
    _jokes = value;
    prefs.setStringList('ff_jokes', value);
  }

  void addToJokes(String value) {
    jokes.add(value);
    prefs.setStringList('ff_jokes', _jokes);
  }

  void removeFromJokes(String value) {
    jokes.remove(value);
    prefs.setStringList('ff_jokes', _jokes);
  }

  void removeAtIndexFromJokes(int index) {
    jokes.removeAt(index);
    prefs.setStringList('ff_jokes', _jokes);
  }

  void updateJokesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    jokes[index] = updateFn(_jokes[index]);
    prefs.setStringList('ff_jokes', _jokes);
  }

  void insertAtIndexInJokes(int index, String value) {
    jokes.insert(index, value);
    prefs.setStringList('ff_jokes', _jokes);
  }

  int _colorTheme = 0;
  int get colorTheme => _colorTheme;
  set colorTheme(int value) {
    _colorTheme = value;
    prefs.setInt('ff_colorTheme', value);
  }

  bool _isCompactMode = false;
  bool get isCompactMode => _isCompactMode;
  set isCompactMode(bool value) {
    _isCompactMode = value;
    prefs.setBool('ff_isCompactMode', value);
  }

  bool _isFirstTimeOpen = true;
  bool get isFirstTimeOpen => _isFirstTimeOpen;
  set isFirstTimeOpen(bool value) {
    _isFirstTimeOpen = value;
    prefs.setBool('ff_isFirstTimeOpen', value);
  }

  bool _isNotificationOn = true;
  bool get isNotificationOn => _isNotificationOn;
  set isNotificationOn(bool value) {
    _isNotificationOn = value;
    prefs.setBool('ff_isNotificationOn', value);
  }

  int _notificationInterval = 1;
  int get notificationInterval => _notificationInterval;
  set notificationInterval(int value) {
    _notificationInterval = value;
    prefs.setInt('ff_notificationInterval', value);
  }

  int _currentItemGroup = 0;
  int get currentItemGroup => _currentItemGroup;
  set currentItemGroup(int value) {
    _currentItemGroup = value;
    prefs.setInt('ff_currentItemGroup', value);
  }

  List<ItemGroupStruct> _itemGroups = [
    ItemGroupStruct.fromSerializableMap(
        jsonDecode('{\"groupID\":\"0\",\"groupName\":\"All Items\"}'))
  ];
  List<ItemGroupStruct> get itemGroups => _itemGroups;
  set itemGroups(List<ItemGroupStruct> value) {
    _itemGroups = value;
    prefs.setStringList(
        'ff_itemGroups', value.map((x) => x.serialize()).toList());
  }

  void addToItemGroups(ItemGroupStruct value) {
    itemGroups.add(value);
    prefs.setStringList(
        'ff_itemGroups', _itemGroups.map((x) => x.serialize()).toList());
  }

  void removeFromItemGroups(ItemGroupStruct value) {
    itemGroups.remove(value);
    prefs.setStringList(
        'ff_itemGroups', _itemGroups.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItemGroups(int index) {
    itemGroups.removeAt(index);
    prefs.setStringList(
        'ff_itemGroups', _itemGroups.map((x) => x.serialize()).toList());
  }

  void updateItemGroupsAtIndex(
    int index,
    ItemGroupStruct Function(ItemGroupStruct) updateFn,
  ) {
    itemGroups[index] = updateFn(_itemGroups[index]);
    prefs.setStringList(
        'ff_itemGroups', _itemGroups.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItemGroups(int index, ItemGroupStruct value) {
    itemGroups.insert(index, value);
    prefs.setStringList(
        'ff_itemGroups', _itemGroups.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
