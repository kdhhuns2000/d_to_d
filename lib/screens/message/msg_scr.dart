import 'dart:convert';
import 'package:d_to_d/models/user.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'msg.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key, required this.roomId, required this.targetUserName});
  final String roomId;
  final String targetUserName;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  StompClient? stompClient;
  final List<Msg> list = [];
  final ScrollController _scrollController = ScrollController();
  final _textController = TextEditingController();
  final myId = User.getInstance().id;

  final socketUrl = 'ws://15.165.26.250:8080/ws';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onConnect(StompFrame frame) {
    stompClient!.subscribe(
        destination: '/sub/channel/${widget.roomId}',
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
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
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
            "channelId": widget.roomId
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
          backgroundColor: Color(0xFFFFC8C8),
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  reverse: false,
                  shrinkWrap: true,
                  controller: _scrollController,
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
                                borderRadius: BorderRadius.circular(15.0),
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
                            onPressed: () =>
                                {sendMessage(), _textController.clear()},
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
