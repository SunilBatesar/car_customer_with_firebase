import 'package:car_booking_customer/Models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._constructor();
  static get instance => SharedPrefs._constructor();

  static late SharedPreferences _preferences;
  getpref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //  ALL KEYS
  static get _languageKey => "languageKey";
  get userKey => "userKey";

  Future<dynamic> setSharedPrefs(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String getSharedPrefs(String key) {
    return _preferences.getString(key) ?? "";
  }

  Future<bool> removSharedPrefs(String key) async {
    return await _preferences.remove(key);
  }

  // LANGUAGE PREFE

  setLanguagePrefe({required LanguageModel model}) {
    _preferences.setString(_languageKey, model.toJson());
  }

  LanguageModel getLanguagePrefe() {
    return LanguageModel.fromjson(
        json: _preferences.getString(_languageKey) ?? "");
  }

  // USER PREFE
  // Future setUserPrefe({required UserModel model}) async {
  //   await _preferences.setString(userKey, jsonEncode(model.tomap()));
  // }

  // UserModel getUserPrefe() {
  //   return UserModel.fromjson(FirebaseResponseModel(
  //       jsonDecode(_preferences.getString(userKey).toString()) ?? {}, ""));
  // }
}
