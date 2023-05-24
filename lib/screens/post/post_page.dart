import 'package:d_to_d/screens/post/mobile_post.dart';
import 'package:d_to_d/widgets/layout/desktop_layout.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/screens/post/desktop_post.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

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
              mobileBody: MobilePost(),
              // tabletBody: TabletLayout(
              //   child: child,
              // ),
              desktopBody: DesktopPost(),
            ),
          ),
        ],
      ),
    );
  }
}
