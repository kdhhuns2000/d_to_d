import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:go_router/go_router.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "D to D",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/message');
            },
            icon: Image.asset("assets/icons/alarm.png"),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
            iconSize: 24,
          )
        ],
      ),
      body: SafeArea(child: widget.child),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        color: Colors.black,
        activeColor: Colors.black,
        backgroundColor: Colors.white,
        style: TabStyle.fixed,
        items: tabItems,
        onTap: (index) => _onTap(index),
      ),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/developer');
        break;
      case 2:
        context.push('/addpost');
        break;
      case 3:
        context.go('/designer');
        break;
      case 4:
        context.go('/setting');
        break;
    }
  }
}
