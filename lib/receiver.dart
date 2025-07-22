import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

class Receiver extends StatefulWidget {
  @override
  _ReceiverState createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  late BroadcastReceiver _receiver;
  String _receivedMessage = "No message received yet.";

  @override
  void initState() {
    super.initState();

    _receiver = BroadcastReceiver(names: ['com.myapp.CUSTOM_ACTION']);
    _receiver.messages.listen((BroadcastMessage message) {
      final data = message.data;

      if (data != null && data.containsKey('message')) {
        setState(() {
          _receivedMessage = "Received broadcast: ${data['message']}";
        });
      }
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
      appBar: AppBar(title: Text("Broadcast Receiver")),
      body: Center(
        child: Text(
          _receivedMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
