import 'package:flutter/material.dart';

class HomeWork1 extends StatefulWidget {
  const HomeWork1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeWork1State createState() => _HomeWork1State();
}

class _HomeWork1State extends State<HomeWork1> {

  List<String> _messages = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      _messages.add(text);
    });
    _textEditingController.clear();
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
                    child: ListView(
                      children: _messages.map((item) {
                        return ListTile(
                          title: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(Icons.message, size: 16,)
                                ),
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: item,
                                  style: const TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
                          _addToList(_textEditingController.text);
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
