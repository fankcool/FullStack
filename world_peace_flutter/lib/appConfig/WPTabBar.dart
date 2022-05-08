import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_peace_flutter/modules/Home/HomePage.dart';
import 'package:world_peace_flutter/modules/Mine/MinePage.dart';
import 'package:world_peace_flutter/modules/Shop/ShopPage.dart';
import 'package:world_peace_flutter/modules/Square/SquarePage.dart';

import '../tools/utils.dart';

class TabBarItem {
  final BottomNavigationBarItem item;

  TabBarItem(
      {required String label, required Widget icon, required Widget activeIcon})
      : item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          label: label,
        );
}

class WPTabBar extends StatefulWidget {
  const WPTabBar({Key? key}) : super(key: key);

  @override
  _WPTabBarState createState() => _WPTabBarState();
}

class _WPTabBarState extends State<WPTabBar> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  late List<TabBarItem> _tabBarItems;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    initView();
  }

  @override
  Widget build(BuildContext context) {
    const border = Border(
      top: BorderSide(
        width: 0,
        color: AppColors.clear,
        style: BorderStyle.solid,
      ),
    );

    final bottomNavigationBar = CupertinoTabBar(
      items: _tabBarItems.map((item) => item.item).toList(),
      inactiveColor: Colors.grey,
      activeColor: Color(getColorFromHex('#FF5346')),
      backgroundColor: AppColors.white,
      currentIndex: _currentIndex,
      border: border,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
      },
    );

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: PageView.builder(
        itemCount: _pages.length,
        controller: _pageController,
        itemBuilder: (ctx, index) {
          return _pages[index];
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  initView() {
    _pageController = PageController(initialPage: _currentIndex);

    _pages = [
      const HomePage(),
      const SquarePage(),
      const ShopPage(),
      const MinePage(),
    ];

    _tabBarItems = [
      TabBarItem(
        label: '首页',
        icon: Image.asset(
          'assets/images/home_def.png',
          fit: BoxFit.cover,
          width: 20,
        ),
        activeIcon: Image.asset(
          'assets/images/home_sel.png',
          fit: BoxFit.cover,
          width: 20,
        ),
      ),
      TabBarItem(
        label: '广场',
        icon: Image.asset(
          'assets/images/mine_def.png',
          fit: BoxFit.cover,
          width: 20,
        ),
        activeIcon: Image.asset(
          'assets/images/mine_sel.png',
          fit: BoxFit.cover,
          width: 20,
        ),
      ),
      TabBarItem(
        label: '商城',
        icon: Image.asset(
          'assets/images/home_def.png',
          fit: BoxFit.cover,
          width: 20,
        ),
        activeIcon: Image.asset(
          'assets/images/home_sel.png',
          fit: BoxFit.cover,
          width: 20,
        ),
      ),
      TabBarItem(
        label: '我的',
        icon: Image.asset(
          'assets/images/mine_def.png',
          fit: BoxFit.cover,
          width: 20,
        ),
        activeIcon: Image.asset(
          'assets/images/mine_sel.png',
          fit: BoxFit.cover,
          width: 20,
        ),
      ),
    ];
  }
}
