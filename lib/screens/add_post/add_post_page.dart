import 'package:d_to_d/screens/add_post/mobile_add_post_page.dart';
import 'package:d_to_d/screens/add_post/desktop_add_post_page.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ResponsiveLayout(
            mobileBody: MobileAddPost(),
            desktopBody: DesktopAddPost(),
          ),
        ),
      ],
    );
  }
}
