import 'package:fight_number/foundations/local_data/hive/hive_helper_impl.dart';

import 'database_helper.dart';
import 'hive/hive_helper.dart';

class DatabaseHelperImpl extends DatabaseHelper {
  DatabaseHelperImpl._internal();

  static final DatabaseHelperImpl instance = DatabaseHelperImpl._internal();

  factory DatabaseHelperImpl() => instance;
  final HiveDBHelper hiveDBHelper = HiveHelperImpl.instance;

  Future<void> initialize() async {}

  @override
  Future getData<T>(String boxName) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<bool> hiveAdd<T>(String boxName, T data) {
    return hiveDBHelper.hiveAdd(boxName, data);
  }

  @override
  Future<bool> hiveDelete<T>(String boxName, String key) {
    return hiveDBHelper.hiveDelete(boxName, key);
  }

  @override
  Future<bool> hiveDeleteAll<T>(String boxName, List<String> keys) {
    return hiveDBHelper.hiveDeleteAll(boxName, keys);
  }

  @override
  Future<T?> hiveGet<T>(String boxName, String key) {
    return hiveDBHelper.hiveGet(boxName, key);
  }

  @override
  Future<List<T>> hiveGetAll<T>(String boxName) {
    return hiveDBHelper.hiveGetAll(boxName);
  }

  @override
  Future<T?> hiveGetAt<T>(String boxName, int index) {
    return hiveDBHelper.hiveGetAt(boxName, index);
  }

  @override
  Future<bool> hivePutOrUpdate<T>(String boxName, String key, T data) {
    return hiveDBHelper.hivePutOrUpdate(boxName, key, data);
  }
}
