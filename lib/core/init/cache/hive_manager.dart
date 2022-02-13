import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_manager/core/constants/hive_keys.dart';
import 'package:hive_manager/core/hive_models/hive_user.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._init();

  static late List<Box<dynamic>> _db;

  static HiveManager get instance => _instance;

  HiveManager._init() {
    _db = [Hive.box("user-info"), Hive.box("user")];
  }

  static preferencesInit() async {
    await Hive.initFlutter();

    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive
      ..init(appDocumentDir.path)
      ..registerAdapter(HiveUserObjectAdapter());

    await openBox();
    return;
  }

  static Future<void> openBox() async {
    _db = [await Hive.openBox("user-info"), await Hive.openBox("user")];
  }

  Future<void> setStringValue(HiveKeys key, String value) async {
    await _db[0].put(key.toString(), value);
  }

  String? getStringValue(HiveKeys key) => _db[0].get(key.toString());

  Future<void> setIntValue(HiveKeys key, int value) async {
    await _db[0].put(key.toString(), value);
  }

  int? getIntValue(HiveKeys key) => _db[0].get(key.toString());

  Future<void> setBoolValue(HiveKeys key, bool value) async {
    await _db[0].put(key.toString(), value);
  }

  bool? getBoolValue(HiveKeys key) => _db[0].get(key.toString());

  Future<void> setGenericValue<T>(HiveKeys key, T value) async {
    await _db[0].put(key.toString(), value);
  }

  T? getGenericValue<T>(HiveKeys key) => _db[0].get(key.toString());

  Future<void> addUser(HiveUserObject user) async {
    await _db[1].add(user);
  }

  Future<void> updateUser(HiveUserObject user, int index) async {
    await _db[1].putAt(index, user);
  }

  HiveUserObject getUser(int index) => _db[1].getAt(index);

  int totalKeyValue() => _db[0].length;

  int totalReminderObject() => _db[1].length;

  void clear() {
    _db[0].clear();
    _db[1].clear();
  }
}
