import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/home/home_body.dart';
import 'package:d_to_d/widgets/home/side_bar.dart';

class DesktopLayout extends StatelessWidget {
  final Widget child;

  const DesktopLayout({
    super.key,
    required this.child,
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
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}
