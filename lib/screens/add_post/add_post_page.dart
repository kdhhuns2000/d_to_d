import 'package:d_to_d/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

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
            child: DottedBorder(
              dashPattern: [8, 8],
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
              borderType: BorderType.RRect,
              radius: Radius.circular(24.0),
              color: kPaleColor,
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/upload.png', color: kPaleColor),
                    Text(
                      '이미지 업로드',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPaleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
