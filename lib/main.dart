import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/src/app.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'ae6bcf099a4885a217f4cd8a63548c5e');
  runApp(const App());
}



