import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() => _instance;

  StorageService._internal();

  final GetStorage _storage = GetStorage();

  Future<void> saveData(String key, String value) async {
    await _storage.write(key, value);
  }

  String? getData(String key) {
    return _storage.read<String>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}