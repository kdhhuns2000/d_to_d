import 'package:d_to_d/models/message.dart';
import 'package:d_to_d/models/user.dart';
import 'package:d_to_d/utils/api/service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final myId = User.getInstance().id;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FutureBuilder(
            future: Service.getMessages(myId),
            builder: (context, snapshot) {
              if (!snapshot.hasData | snapshot.hasError) {
                return CircularProgressIndicator();
              } else {
                List<Message> chatList = snapshot.data!;
                print(chatList);
                return ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      final chat = chatList[index];
                      return ListTile(
                        title: Text(chat.targetUserName),
                        trailing: Text(chat.targetUserCategory),
                        onTap: () => {
                          context.go(
                              '/message/room?roomId=${chat.id}&targetUserName=${chat.targetUserName}')
                        },
                      );
                    });
              }
            }));
  }
}
