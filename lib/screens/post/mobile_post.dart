import 'package:d_to_d/utils/api/service.dart';
import 'package:flutter/material.dart';
import 'package:d_to_d/models/post.dart';
import 'package:go_router/go_router.dart';

class MobilePost extends StatefulWidget {
  final String postId;

  const MobilePost({super.key, required this.postId});

  @override
  State<MobilePost> createState() => _MobilePostState();
}

class _MobilePostState extends State<MobilePost> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Service.getPost(widget.postId),
      builder: (context, snapshot) {
        if (!snapshot.hasData | snapshot.hasError) {
          return CircularProgressIndicator();
        } else {
          Post post = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Image.network(
                      post.image,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          const Divider(
                            thickness: 2.0,
                          ),
                          Text(
                            post.content,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(width: 0.1),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.writer,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          post.category,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => {
                        context.go(
                            '/message/room?roomId=${post.userId}&targetUserName=${post.writer}')
                      },
                      child: Text(
                        'CONNECT',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
