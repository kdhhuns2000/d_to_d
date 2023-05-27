import 'package:d_to_d/widgets/image_upload.dart';
import 'package:flutter/material.dart';

class MobileAddPost extends StatelessWidget {
  const MobileAddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '제목',
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '내용을 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: ImageUpload(),
          ),
        ],
      ),
    );
  }
}
