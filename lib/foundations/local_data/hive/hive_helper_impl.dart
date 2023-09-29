import 'package:hive_flutter/hive_flutter.dart';

import 'hive_helper.dart';

class HiveHelperImpl implements HiveDBHelper {
  HiveHelperImpl._internal();

  static final HiveHelperImpl instance = HiveHelperImpl._internal();

  factory HiveHelperImpl() => instance;

  Future<void> initialize() async {
    await Hive.initFlutter();
  }

  @override
  Future<List> getData<T>(String boxName) async {
    Box<T> dataBox = Hive.box<T>(boxName);
    return dataBox.values.toList();
  }

  @override
  Future<bool> hiveAdd<T>(String boxName, T data) async {
    try {
      Box<T> box = await Hive.openBox<T>(boxName);
      await box.add(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> hivePutOrUpdate<T>(String boxName, String key, T data) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    box.put(key, data);
    return true;
  }

  @override
  Future<T?> hiveGet<T>(String boxName, String key) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

  @override
  Future<T?> hiveGetAt<T>(String boxName, int index) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    return box.getAt(index);
  }

  @override
  Future<List<T>> hiveGetAll<T>(String boxName) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

  @override
  Future<bool> hiveDelete<T>(String boxName, String key) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    box.delete(key);
    return true;
  }

  @override
  Future<bool> hiveDeleteAll<T>(String boxName, List<String> keys) async {
    Box<T> box = await Hive.openBox<T>(boxName);
    box.deleteAll(keys);
    return true;
  }
}
