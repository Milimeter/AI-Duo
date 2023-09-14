import 'package:get_storage/get_storage.dart';

class Storage {
  static setStep(String step) async {
    final GetStorage storage = GetStorage();
    storage.write('step', step);
  }

  static getStep() async {
    final GetStorage storage = GetStorage();
    return storage.read('step');
  }

  static saveData(String key, String value) async {
    final GetStorage storage = GetStorage();
    storage.write(key, value);
  }

  static readData(String key) async {
    final GetStorage storage = GetStorage();
    return storage.read(key);
  }

  static removeData(String key) async {
    final GetStorage storage = GetStorage();
    storage.remove(key);
  }

  static eraseMemory() async {
    final GetStorage storage = GetStorage();
    storage.erase();
  }
}