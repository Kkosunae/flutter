import 'package:google_sign_in/google_sign_in.dart';
import 'package:kkosunae/src/services/social_login.dart';

class GoogleLogin implements SocialLogin {
  @override
  Future<bool> login() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser != null) {
      print("success google login");
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