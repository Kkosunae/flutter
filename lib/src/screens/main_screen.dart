import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:kkosunae/src/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/main_viewmodel.dart';
import '../services/login_platform.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainState createState() => MainState();
}

class MainState extends State<MainScreen> {
  late SharedPreferences _preferences;
  bool _isLogin = false;
  LoginPlatform _loginPlatform = LoginPlatform.none;
  late final viewModel;
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label:'Map',
        icon: Icon(Icons.map)),
    BottomNavigationBarItem(
        label:'WALK',
        icon: Icon(Icons.accessibility)),
    BottomNavigationBarItem(
        label:'POINT',
        icon: Icon(Icons.point_of_sale)),
    BottomNavigationBarItem(
        label:'PROFILE',
        icon: Icon(Icons.my_library_add)),
  ];

  // 각 탭마다 설정
  List pages=[
    Container(
      child: NaverMap(
        options: const NaverMapViewOptions(),
        onMapReady: (controller) {
          print("네이버 맵 로딩됨!");
        },
      ),
    ),
    Container(
      child: Center(child: Text('WALK')),
    ),
    Container(
      child: Center(child: Text('POINT')),
    ),
    Container(
      child: Center(child: Text('PROFILE')),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    if(_isLogin) {
      return MaterialApp(
        home: Scaffold(
          body: pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey.withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 10,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: bottomItems,
          ),
        ),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    viewModel = MainViewModel(_loginPlatform);

    _loadId();
  }
  _loadId() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _isLogin = (_preferences.getBool('isLogin') ?? false);
    });
  }
}