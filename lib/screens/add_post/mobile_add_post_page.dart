import 'package:d_to_d/models/user.dart';
import 'package:d_to_d/utils/api/service.dart';
import 'package:d_to_d/widgets/image_upload.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileAddPost extends ConsumerStatefulWidget {
  const MobileAddPost({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileAddPostState();
}

class _MobileAddPostState extends ConsumerState<MobileAddPost> {
  User user = User.getInstance();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageState = ref.watch(imageFileStateProvider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: '제목',
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: ImageUpload(),
          ),
          TextField(
            controller: _contentController,
            minLines: 5,
            maxLines: 100,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '내용을 입력하세요',
            ),
          ),
          ElevatedButton(
            // onPressed: () => print(user.id),
            onPressed: () {
              if (imageState != null) {
                post(imageState);
              }
            },
            child: Text('게시'),
          ),
        ],
      ),
    );
  }

  Future<void> post(Uint8List bytes) async {
    bool result = await Service.addPost(
      user.id,
      _titleController.text,
      _contentController.text,
      user.category,
      bytes,
    );
    if (result) {
      context.pop();
    } else {
      Fluttertoast.showToast(
        msg: '문제가 발생했습니다.',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
