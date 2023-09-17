import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(56.0);  // 기본 높이 설정

  @override
  Widget build(BuildContext context) {
    const settingIcon = Icon(Icons.settings);
    const notificationIcon = Icon(Icons.notifications_none);
    const moreIcon = Icon(Icons.more_vert);
    const searchIcon = Icon(Icons.search);
    return AppBar(
      // leading: BackButton(
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            print('search button is clicked');
          },
          icon: this.title == "지도" ? searchIcon : settingIcon,
        ),
        IconButton(
          onPressed: () {
            print('notification button is clicked');
          },
          icon: notificationIcon,
        ),
        IconButton(
          onPressed: () {
            print('more button is clicked');
          },
          icon: moreIcon,
        ),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
    );
  }
}