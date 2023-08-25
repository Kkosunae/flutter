import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/src/services/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async{
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공 ${token.accessToken}');
          return true;
        } catch (e) {
          print('카카오톡으로 로그인 살패 ${e}');
          return false;
        }
      } else {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('카카오톡으로 로그인 성공 ${token.accessToken}');
          return true;
        } catch (e) {
          print('카카오톡으로 로그인 살패 ${e}');
          return false;
        }

      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async{
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (e) {
      return false;
    }
  }
}