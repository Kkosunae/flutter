import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeWidget(),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                IconButton(onPressed: () {}, icon: Icon(Icons.map)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text('메인 화면'),
    );
  }
}
