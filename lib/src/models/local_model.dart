
import 'package:shared_preferences/shared_preferences.dart';

class LocalModel {
  static bool _isLogin = false;
  void saveIsLogin(bool isLogin) async {
      _isLogin = isLogin;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogin", isLogin);
  }

  Future<bool> getIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? login = prefs.getBool('isLogin');
    if(login == null) {
      _isLogin = false;
    } else {
      _isLogin = login;
    }
    return Future<bool>.value(_isLogin);
  }
}