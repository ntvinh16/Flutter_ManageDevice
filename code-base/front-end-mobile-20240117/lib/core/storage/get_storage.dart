import 'package:get_storage/get_storage.dart';

class BaseStorageRepo {
  final box = GetStorage();

  Future<void> saveData(String key, dynamic value) async {
    return await box.write(key, value);
  }

  T readData<T>(String key) {
    return box.read(key);
  }

  bool hasData<T>(String key) {
    return box.hasData(key);
  }
}
