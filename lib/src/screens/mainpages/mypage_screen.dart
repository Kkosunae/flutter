import 'package:flutter/material.dart';

import '../../widget/custom_app_bar_widget.dart';

class MypageScreen extends StatefulWidget {
  @override
  _MypageScreenState createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  late TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: "Tab 1"),
        Tab(text: "Tab 2"),
        Tab(text: "Tab 3"),
      ],
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
    );
  }

  Widget _profile() {
    const profileImage = CircleAvatar(
      radius: 50,
    );

    const level = Text(
      'level 999',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );

    const nickname = Text(
      'nickname',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );

    const follower = Text(
      'follower 999',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );

    const following = Text(
      'following 999',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );

    const settingProfile = Text(
      '프로필 설정',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );

    const settingPet = Text(
      '반려동물 설정',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );

    return const Column(
      children: [
        profileImage,
        level,
        nickname,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            follower,
            following,
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            settingProfile,
            settingPet,
          ],
        ),
      ],
    );
  }

  Widget _myPosts() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 1개의 행에 항목을 3개씩
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1.0,
      ),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: Colors.grey,
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "마이페이지"),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: _profile(),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                minHeight: 60.0,
                maxHeight: 60.0,
                child: Container(
                  color: Colors.white,
                  child: _tabBar(),
                ),
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _myPosts();
                },
                childCount: 1,
              ),
            ),
          ],
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
