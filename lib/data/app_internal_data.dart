import 'package:get_storage/get_storage.dart';

class AppInternalData {
  AppInternalData._();

  static final AppInternalData _instance = AppInternalData._();
  factory AppInternalData() => _instance;

  static init() async {
    await GetStorage.init('AppPreferences');
  }

  final getStorageInstance = GetStorage('AppPreferences');

  void saveDarkMode(bool isDarkMode) async {
    await getStorageInstance.write('isDarkMode', isDarkMode);

    await getStorageInstance.save();
  }

  bool getDarkMode() {
    var drk = getStorageInstance.read<bool>('isDarkMode') ?? false;
    return drk;
  }
}
