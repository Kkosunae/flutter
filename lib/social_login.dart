import 'package:kkosunae/login_platform.dart';

abstract class SocialLogin {
  Future<bool> login();
  Future<bool> logout();
}