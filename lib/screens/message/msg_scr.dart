import 'dart:convert';
import 'package:d_to_d/models/user.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'msg.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key, required this.targetUserId, required this.targetUserName});
  final String targetUserId;
  final String targetUserName;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  StompClient? stompClient;
  List<Msg> list = [];
  final _textController = TextEditingController();
  final myId = User.getInstance().id;

  final socketUrl = 'ws://15.165.26.250:8080/ws';

  void onConnect(StompFrame frame) {
    stompClient!.subscribe(
        destination: '/sub/channel/1',
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> obj = json.decode(frame.body!);
            Msg message = Msg(
                content: obj['content'],
                sender: obj['sender'],
                channelId: obj['channelId']);
            setState(() {
              list.add(message);
            });
          }
        });
  }

  sendMessage() {
    setState(() {
      stompClient!.send(
          destination: '/pub/hello',
          body: json.encode({
            "content": _textController.value.text,
            "sender": myId,
            "channelId": "1"
          }));
    });
  }

  @override
  void initState() {
    super.initState();
    if (stompClient == null) {
      stompClient = StompClient(
          config: StompConfig(
        url: socketUrl,
        onConnect: onConnect,
        onWebSocketError: (dynamic error) => print(error.toString()),
      ));
      stompClient!.activate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.targetUserName),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    final isMyMessage =
                        list[position].sender.toString() == myId.toString();
                    return GestureDetector(
                        child: FittedBox(
                            alignment: isMyMessage
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Card(
                              color: isMyMessage
                                  ? Color(0xFFFFC8C8)
                                  : Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Align(
                                  alignment: isMyMessage
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      list[position].content,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            )));
                  },
                  itemCount: list.length,
                )),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            controller: _textController,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(hintText: "Send Message"),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: ElevatedButton(
                            onPressed:
                                sendMessage, // 여기 사용된 sendMessage 함수는 차후 websocket 연결에서 다룹니다.
                            child: Icon(Icons.send),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
