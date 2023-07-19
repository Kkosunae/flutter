import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/social_login.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }
  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
  Future printTokenInfo() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print('토큰 정보 보기 성공'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초');
    } catch (error) {
      print('토큰 정보 보기 실패 $error');
    }
  }
}