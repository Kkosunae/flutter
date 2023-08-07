
import 'package:flutter/material.dart';
import 'package:kkosunae/src/models/local_model.dart';
import 'package:kkosunae/src/ui/main_screen.dart';



class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: MainPage()
      );
  }
}