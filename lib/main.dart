import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/Screens/main_screen.dart';
import 'package:kkosunae/login_platform.dart';
import 'package:kkosunae/main_viewmodel.dart';

import 'Screens/welcome_screen.dart';

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
      home: Scaffold(
       body: MainApp(),
      ),

    );
  }
}

