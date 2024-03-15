
import 'package:front_end_mobile_20240117/core/storage/get_storage.dart';

class StorageRepoImpl extends BaseStorageRepo {
  final TOKEN_KEY = 'TOKEN_KEY';

  Future<void> saveToken(String? token) {
    return saveData(TOKEN_KEY, token);
  }

  String? getToken() {
    return readData(TOKEN_KEY);
  }

  Future<void> clearData() async {
    await Future.wait([
      box.remove(TOKEN_KEY),
    ]);
  }
}
