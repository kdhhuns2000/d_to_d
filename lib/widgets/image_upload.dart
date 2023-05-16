import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:d_to_d/utils/constant.dart';

class ImageUpload extends StatelessWidget {
  const ImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
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
    );
  }
}
