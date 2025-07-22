import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

class CustomReceiverScreen extends StatefulWidget {
  @override
  _CustomReceiverScreenState createState() => _CustomReceiverScreenState();
}

class _CustomReceiverScreenState extends State<CustomReceiverScreen> {
  late final BroadcastReceiver _receiver;
  String _receivedMessage = "Waiting for broadcast...";

  @override
  void initState() {
    super.initState();
    _receiver = BroadcastReceiver(names: ['com.myapp.CUSTOM_ACTION']);
    _receiver.messages.listen((message) {
      final data = message.data;
      final msg = data != null && data.containsKey('message') ? data['message'] : '(no message)';
      setState(() {
        _receivedMessage = "Received: $msg";
      });
    });
    _receiver.start();
  }

  @override
  void dispose() {
    _receiver.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Receiver")),
      body: Center(
        child: Text(
          _receivedMessage,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
