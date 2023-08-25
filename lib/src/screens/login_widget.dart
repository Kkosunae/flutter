import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kkosunae/src/screens/user_onboarding_screen.dart';

import '../provider/main_viewmodel.dart';
import '../services/login_platform.dart';

LoginPlatform _loginPlatform = LoginPlatform.none;

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  final viewModel = MainViewModel(_loginPlatform);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("로그인 상태 : ${viewModel.isLogined}"),
          Text("결과값 토큰 nickname : " + (viewModel.user?.kakaoAccount?.profile?.nickname ?? '')),

          SizedBox( // kakao
              width: 300,
              child: IconButton(
                onPressed: () async {
                  _loginPlatform = LoginPlatform.kakao;
                  viewModel.setLoginPlatform(_loginPlatform);
                  await viewModel.login();
                  if(viewModel.isLogined) {
                    await viewModel.saveData();
                    await viewModel.loadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserOnboardingScreen()),
                    );
                  }
                  setState(() {});
                },
                icon: Image.asset('assets/kakao_login_medium_narrow.png'), )
          ),
          if (Platform.isAndroid)
          SizedBox( // google
              width: 300,
              child: ElevatedButton(
                onPressed: () async {
                  _loginPlatform =LoginPlatform.google;
                  viewModel.setLoginPlatform(_loginPlatform);
                  await viewModel.login();
                  if(viewModel.isLogined) {
                    await viewModel.saveData();
                    await viewModel.loadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserOnboardingScreen()),
                    );
                  }
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(183, 45),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                ),
                child: Row(
                  //spaceEvenly: 요소들을 균등하게 배치하는 속성
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/glogo.png'),
                    Text('Login with Google',
                      style: TextStyle(color: Colors.black87, fontSize: 15.0),
                    ),
                  ],
                ),
              )
          ),
          if (Platform.isIOS)
          SizedBox( // apple
              width: 300,
              child: IconButton(
                onPressed: () async {
                  _loginPlatform =LoginPlatform.apple;
                  viewModel.setLoginPlatform(_loginPlatform);
                  await viewModel.login();
                  if(viewModel.isLogined) {
                    await viewModel.saveData();
                    await viewModel.loadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserOnboardingScreen()),
                    );
                  }
                  setState(() {});
                },
                icon: Image.asset('assets/kakao_login_medium_narrow.png'), )
          ),
          ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {});
              },
              child: Text('Logout')),
          ElevatedButton(
              onPressed: () async {
                await viewModel.printTokenInfo();
              },
              child: Text('tokenInfo'))
        ],
      ),
    );
  }
}
