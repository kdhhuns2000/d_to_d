import 'package:d_to_d/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d_to_d/screens/add_post/mobile_add_post_page.dart';
import 'package:d_to_d/screens/add_post/desktop_add_post_page.dart';
import 'package:d_to_d/widgets/responsive/responsive_layout.dart';

class AddPost extends ConsumerStatefulWidget {
  const AddPost({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPostState();
}

class _AddPostState extends ConsumerState<AddPost> {

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
