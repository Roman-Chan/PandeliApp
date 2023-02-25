import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider {
  final SharedPreferences _prefs;

  TokenProvider(this._prefs);

  String getToken() {
    return _prefs.getString('bearer') ?? '';
  }

  void setToken(String token) {
    _prefs.setString('bearer',token);
  }

  void removeToken() {
    _prefs.remove('bearer');
  }
}


