import 'package:kkosunae/src/services/social_login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLogin implements SocialLogin {
  @override
  Future<bool> logout() async {
    return true;
  }

  @override
  Future<bool> login() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // 이제 `credential`을 사용하여 사용자를 인증하십시오.
    print("identityToken : " + "${credential.identityToken}");
    print(credential.authorizationCode);

    return true;
  }
}