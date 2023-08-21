import 'package:flutter/material.dart';
import 'package:kkosunae/src/recources/login_platform.dart';

import '../constants.dart';
import '../blocs/main_viewmodel.dart';
import 'login.dart';

LoginPlatform _loginPlatform = LoginPlatform.none;

class WelcomeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeImage();
}

class _WelcomeImage extends State<WelcomeImage> {
  final viewModel = MainViewModel(_loginPlatform);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("로그인 상태 : ${viewModel.isLogined}"),
          Text("결과값 토큰 nickname : " + (viewModel.user?.kakaoAccount?.profile?.nickname ?? '')),

          SizedBox(
              width: 300,
              child: IconButton(
                onPressed: () async {
                  _loginPlatform =LoginPlatform.kakao;
                  viewModel.setLoginPlatform(_loginPlatform);
                  await viewModel.login();
                  if(viewModel.isLogined) {
                    await viewModel.saveData();
                    await viewModel.loadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstScreen()),
                    );
                  }
                  setState(() {});
                },
                icon: Image.asset('assets/kakao_login_medium_narrow.png'), )
          ),
          SizedBox(
              width: 300,
              child: IconButton(
                onPressed: () async {
                  _loginPlatform =LoginPlatform.google;
                  viewModel.setLoginPlatform(_loginPlatform);
                  await viewModel.login();
                  if(viewModel.isLogined) {
                    await viewModel.saveData();
                    await viewModel.loadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstScreen()),
                    );
                  }
                  setState(() {});
                },
                icon: Image.asset('assets/kakao_login_medium_narrow.png'), )
          ),
          SizedBox(
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
                      MaterialPageRoute(builder: (context) => const FirstScreen()),
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
