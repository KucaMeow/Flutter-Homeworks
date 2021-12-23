import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'data/chat_data.dart';
import 'model/entities.dart';

const currentUserName = "Stepan";
final messageStorage = MessageStateManager();

class HomeWork2 extends StatefulWidget {
  const HomeWork2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork2State createState() => _HomeWork2State();
}

class _HomeWork2State extends State<HomeWork2> {

  final TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String text) {
    setState(() {
      String text = _textEditingController.text;
      messageStorage.sendMessage(Message(currentUserName, text));
    });
    _textEditingController.clear();
  }

  @override
  void initState() {
    messageStorage.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Messages(messageStorage),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.send_rounded),
                        onTap: () {
                          _sendMessage(_textEditingController.text);
                        },
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class Messages extends StatefulWidget {

  final MessageStateManager messageStore;

  const Messages(this.messageStore);

  @override
  _MessagesState createState() => _MessagesState();

}
class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) =>
            ListView.builder(
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                            child: Icon(Icons.message, size: 16,)
                        ),
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: widget.messageStore.data[i].author + ': ' +
                              widget.messageStore.data[i].message,
                          style: widget.messageStore.data[i].author != currentUserName ?
                          const TextStyle(
                              color: Colors.black54, fontSize: 16) :
                          const TextStyle(
                              color: Colors.black38, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.messageStore.data.length,
            )
    );
  }
}
