abstract class HiveDBHelper {
  Future getData<T>(String boxName);

  Future<bool> hivePutOrUpdate<T>(String boxName, String key, T data);

  Future<bool> hiveAdd<T>(String boxName, T data);

  Future<T?> hiveGet<T>(String boxName, String key);

  Future<T?> hiveGetAt<T>(String boxName, int index);

  Future<List<T>> hiveGetAll<T>(String boxName);

  Future<bool> hiveDelete<T>(String boxName, String key);

  Future<bool> hiveDeleteAll<T>(String boxName, List<String> keys);
}
