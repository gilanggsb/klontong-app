import 'package:get_storage/get_storage.dart';

import '../../lib.dart';

class StorageService {
  final GetStorage storage;
  StorageService(this.storage);

  Future<void> save({required StorageKeys key, required String value}) async {
    Logger.info(
      "StorageService \nMethod : save \nkey : ${key.value} \ndata : $value",
    );
    await storage.write(key.value, value);
  }

  Future<String?> get(StorageKeys key) async {
    var data = storage.read(key.value);
    Logger.info(
      "StorageService \nMethod : get \nkey : ${key.value} \ndata : $data",
    );
    return data;
  }

  Future<void> remove(StorageKeys key) async {
    Logger.info("StorageService \nMethod : remove \nkey : ${key.value} ");
    await storage.remove(key.value);
  }

  Future<bool> containsKey(StorageKeys key) async {
    Logger.info("StorageService \nMethod : containsKey \nkey :  ${key.value} ");
    var containsKey = storage.hasData(key.value);
    return containsKey;
  }

  Future<void> erase() async {
    Logger.info("StorageService \nMethod : erase all data");
    await storage.erase();
  }

  Future<String?> getCurrentTheme() async {
    return await get(StorageKeys.theme);
  }

  Future<void> switchTheme(bool value) async {
    return await save(key: StorageKeys.theme, value: value ? "dark" : "light");
  }
}
