import 'package:d_to_d/screens/setting/setting_page.dart';
import 'package:d_to_d/widgets/bottom_navigation_widget.dart';
import 'package:d_to_d/widgets/main_widgets/main_body.dart';
import 'package:d_to_d/widgets/main_widgets/search_bar.dart';
import 'package:d_to_d/widgets/main_widgets/side_bar.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _bottomNavController = StateNotifierProvider<BottomNavController, int>(
    (ref) => BottomNavController(0));

class BottomNavController extends StateNotifier<int> {
  BottomNavController(super.state);

  void setPosition(int value) {
    state = value;
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // static bool isDesktop1(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  // static bool isDesktop2(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  // static bool isDesktop2(BuildContext context) =>
  //     MediaQuery.of(context).size.width > 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: ResponsiveLayout(
              mobileBody: Mobile(),
              tabletBody: Table(),
              desktopBody: Desktop(),
            ),
          ),
        ],
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo.png"),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 50, 0),
              child: Text(
                "D to D",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            SearchBar(),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
            iconSize: 24,
          )
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SideBar(),
          ),
          Expanded(
            flex: 5,
            child: MainBody(),
          ),
        ],
      ),
    );
  }
}

class Table extends StatelessWidget {
  const Table({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
            onPressed: () {},
            icon: Image.asset("assets/icons/alarm.png"),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
            iconSize: 19,
          )
        ],
      ),
      body: MainBody(),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    super.key,
  });

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
            onPressed: () {},
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
      body: widget.child,
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
