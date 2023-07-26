import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/apple_login.dart';
import 'package:kkosunae/google_login.dart';
import 'package:kkosunae/kakao_login.dart';
import 'package:kkosunae/login_platform.dart';
import 'package:kkosunae/social_login.dart';

class MainViewModel {
  SocialLogin _socialLogin = KakaoLogin();
  bool isLogined = false;
  LoginPlatform mPlatform = LoginPlatform.none;
  User? user; // kakao

  MainViewModel(this.mPlatform);

  Future setLoginPlatform(LoginPlatform platform) async {
    mPlatform = platform;
    switch (mPlatform) {
      case LoginPlatform.google :
        _socialLogin = GoogleLogin();
        break;
      case LoginPlatform.kakao :
        _socialLogin = KakaoLogin();
        break;
      case LoginPlatform.apple:
        _socialLogin = AppleLogin();
        break;
      case LoginPlatform.none :
        break;
    }
  }
  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      switch (mPlatform) {
        case LoginPlatform.google :
          break;
        case LoginPlatform.kakao :
          user = await UserApi.instance.me();
          break;
        case LoginPlatform.apple:
          break;
        case LoginPlatform.none :
          break;
      }
    }


  }
  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    switch (mPlatform) {
      case LoginPlatform.google :
        break;
      case LoginPlatform.kakao :
        user = null;
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none :
        break;
    }

  }
  Future printTokenInfo() async {
    switch (mPlatform) {
      case LoginPlatform.google :
        final currentUser = GoogleSignIn().currentUser;
        if(currentUser != null) {
          print('name = ${currentUser.displayName}');
          print('email = ${currentUser.email}');
          print('id = ${currentUser.id}');
        }

        break;
      case LoginPlatform.kakao :
        try {
          AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
          print('토큰 정보 보기 성공'
              '\n회원정보: ${tokenInfo.id}'
              '\n만료시간: ${tokenInfo.expiresIn} 초');
        } catch (error) {
          print('토큰 정보 보기 실패 $error');
        }
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none :
        break;
    }

  }
}