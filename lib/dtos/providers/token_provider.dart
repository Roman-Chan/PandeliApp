import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider {
  final SharedPreferences _prefs;

  TokenProvider(this._prefs);

  String getToken() {
    return _prefs.getString('bearer') ?? '';
  }

   String getid() {
    return _prefs.getString('id') ?? '';
  }

  void setToken(String token) {
    _prefs.setString('bearer','bearer $token');
  }
  void setId(String id) {
    _prefs.setString('id',id);
  }

  void removeToken() {
    _prefs.remove('bearer');
  }

  void removeId(){
    _prefs.remove('id');
  }
}


