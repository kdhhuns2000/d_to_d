import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:d_to_d/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageFileStateProvider = StateProvider<XFile?>((ref) => null);

class ImageUpload extends ConsumerWidget {
  const ImageUpload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    XFile? imageFile;
    final imageState = ref.watch(imageFileStateProvider);
    return GestureDetector(
      onTap: () async {
        imageFile = await pickFile();
        if (imageFile != null) {
          ref.read(imageFileStateProvider.notifier).state = imageFile;
        }
      },
      child: imageState != null
          // ? Image.memory(imageState.bytes!)
          ? Image.file(File(imageState.path))
          : DottedBorder(
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
    );
  }

  Future<XFile?> pickFile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile;
    }
  }
}
