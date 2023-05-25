import 'package:flutter/material.dart';
import 'package:d_to_d/widgets/image_upload.dart';

class DesktopAddPost extends StatelessWidget {
  const DesktopAddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'addpost',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
