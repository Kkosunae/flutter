import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kkosunae/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'm3lw8o5fjq');
  KakaoSdk.init(nativeAppKey: 'ae6bcf099a4885a217f4cd8a63548c5e');
  runApp(const App());
}



