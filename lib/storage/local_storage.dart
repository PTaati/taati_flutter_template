import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _sharedPreferences;
  static const _prefixKey = 'buddher_';

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}