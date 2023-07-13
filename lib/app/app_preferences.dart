import 'dart:convert';

import 'package:betweener_app/core/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//enum to represent the different preference keys
enum PrefKeys { name, email, token, logedIn, user }

// A class to handle the app shared preferences
class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //////////////////////////////////////////////////////////////////////////////

  //------------------------- GET User INFORMATION --------------------------

  User getUser() {
    String? user = _sharedPreferences.getString(PrefKeys.user.name);
    if (user != null) {
      var map = jsonDecode(_sharedPreferences.getString(PrefKeys.user.name)!);
      return User.fromJson(map);
    }
    return User();
  }
  //------------------------- SET User INFORMATION --------------------------

  Future<bool> setUser(User user) async {
    String userJson = jsonEncode(user);
    return await _sharedPreferences.setString(PrefKeys.user.name, userJson);
  }

  //------------------------- User Logged In --------------------------
  Future setUserLoggedIn() async {
    await _sharedPreferences.setBool(PrefKeys.logedIn.toString(), true);
  }

  //------------------------- Check if User is LoggedIn --------------
  bool isUserLoggedIn() =>
      _sharedPreferences.getBool(PrefKeys.logedIn.toString()) ?? false;

  //------------------------- User Logged Out --------------------------
  Future logout() async {
    await _sharedPreferences.remove(PrefKeys.logedIn.toString());
  }

  //////////////////////////////////////////////////////////////////////////////
}
