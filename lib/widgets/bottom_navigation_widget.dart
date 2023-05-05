import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with SingleTickerProviderStateMixin {
  final List<TabItem> tabItems = [
    TabItem(
      icon: Image.asset('assets/icons/home_FILL0.png'),
      activeIcon: Image.asset('assets/icons/home_FILL1.png'),
      title: '홈',
    ),
    TabItem(
      icon: Image.asset('assets/icons/desktop_windows_FILL0.png'),
      activeIcon: Image.asset('assets/icons/desktop_windows_FILL1.png'),
      title: '개발자',
    ),
    TabItem(
      icon: Icon(
        Icons.add_circle_outline,
        color: Colors.black,
        size: 40.0,
      ),
    ),
    TabItem(
      icon: Image.asset('assets/icons/palette_FILL0.png'),
      activeIcon: Image.asset('assets/icons/palette_FILL1.png'),
      title: '디자이너',
    ),
    TabItem(
      icon: Image.asset('assets/icons/settings_FILL0.png'),
      activeIcon: Image.asset('assets/icons/settings_FILL1.png'),
      title: '설정',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: 0,
      color: Colors.black,
      activeColor: Colors.black,
      backgroundColor: Colors.white,
      style: TabStyle.fixed,
      items: tabItems,
      onTap: (index) => _onTap(index),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 4:
        context.go('/setting');
        break;
    }
  }
}
