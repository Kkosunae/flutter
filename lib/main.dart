import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/google_login.dart';
import 'package:kkosunae/kakao_login.dart';
import 'package:kkosunae/login_platform.dart';
import 'package:kkosunae/main_viewmodel.dart';

late final MainViewModel viewModel;
LoginPlatform _loginPlatform = LoginPlatform.none;

void main() {
  KakaoSdk.init(nativeAppKey: 'ae6bcf099a4885a217f4cd8a63548c5e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}
  class MyHomePage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    final viewModel = MainViewModel(_loginPlatform);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (){},
                    icon : Icon(Icons.home)),
                IconButton(onPressed: (){}, icon: Icon(Icons.map)),
              ],
            ),
          ),

        ),
      );
    }

  }
