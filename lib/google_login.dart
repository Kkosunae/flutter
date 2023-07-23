import 'package:google_sign_in/google_sign_in.dart';
import 'package:kkosunae/login_platform.dart';
import 'package:kkosunae/social_login.dart';

class GoogleLogin implements SocialLogin {
  @override
  Future<bool> login() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async{
    await GoogleSignIn().signOut();
    return true;
  }


}