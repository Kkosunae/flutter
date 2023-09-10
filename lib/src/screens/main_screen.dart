import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kkosunae/src/screens/login_screen.dart';
import 'package:kkosunae/src/screens/shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kkosunae/src/provider/main_viewmodel.dart';
import 'package:kkosunae/src/services/login_platform.dart';
import 'package:kkosunae/src/screens/point_screen.dart';
import 'package:kkosunae/src/screens/home_screen.dart';
import 'package:kkosunae/src/screens/map_screen.dart';
import 'package:kkosunae/src/screens/mypage_screen.dart';

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

  List<BottomNavigationBarItem> bottomItems = [ // BottomNavigation
    BottomNavigationBarItem(
        label:'HOME',
        icon: Icon(Icons.home)),
    BottomNavigationBarItem(
        label:'MAP',
        icon: Icon(Icons.map)),
    BottomNavigationBarItem(
        label:'POINT',
        icon: Icon(Icons.point_of_sale)),
    BottomNavigationBarItem(
        label:'SHOP',
        icon: Icon(Icons.shop)),
    BottomNavigationBarItem(
        label:'MY',
        icon: Icon(Icons.person)),
  ];

  // 각 탭마다 설정
  List pages=[
    HomeScreen(),
    MapScreen(),
    PointScreen(),
    ShopScreen(),
    MypageScreen(),
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
            // Label 표시 안하기
            // showSelectedLabels: false,
            // showUnselectedLabels: false,

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
