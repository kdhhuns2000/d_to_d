import 'package:d_to_d/screens/add_post/mobile_add_post_page.dart';
import 'package:d_to_d/screens/add_post/desktop_add_post_page.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    print("Entered 'AddPost' page"); // 'AddPost' 페이지에 진입했을 때 메시지 출력
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
