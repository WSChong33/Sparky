import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  IO.Socket? _socket;
  TextEditingController _textEditingController = TextEditingController();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _initSocket();
  }

  void _initSocket() {
    _socket = IO.io('http://localhost:3000');

    _socket!.on('connect', (_) {
      print('Connected');
    });

    _socket!.on('message', (data) {
      setState(() {
        _messages.add(data);
      });
    });

    _socket!.on('disconnect', (_) {
      print('Disconnected');
    });
  }

  void _sendMessage(String message) {
    _textEditingController.clear();
    _socket!.emit('message', message);
  }

  @override
  void dispose() {
    _socket!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: 'Enter a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_textEditingController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
