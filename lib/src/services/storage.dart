import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  late SharedPreferences store;

  Storage() {
    initializeStorage();
  }

  Future<void> initializeStorage() async {
    store = await SharedPreferences.getInstance();
  }

  void storageSave(String key, List<String> value) async {
    await initializeStorage();
    await store.setStringList(key, value);
  }

  dynamic storageGet(
    String key,
  ) async {
    await initializeStorage();
    var result = store.getStringList(key);
    return result;
  }
}
