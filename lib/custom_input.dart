import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

class CustomInput extends StatefulWidget {
  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final TextEditingController _controller = TextEditingController();
  String _status = "";

  Future<void> _sendCustomBroadcast(String message) async {
    try {
      await sendBroadcast(
        BroadcastMessage(
          name: 'com.myapp.CUSTOM_ACTION',
          data: {'message': message},
        ),
      );
      setState(() {
        _status = "Broadcast sent: $message";
      });
    } catch (e) {
      setState(() {
        _status = "Failed to send broadcast: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Message Broadcaster")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Enter a message to broadcast:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Your message",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Broadcast"),
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  _sendCustomBroadcast(text);
                }
              },
            ),
            SizedBox(height: 16),
            Text(_status, style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
