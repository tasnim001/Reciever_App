import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomInput extends StatefulWidget {
  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final TextEditingController _controller = TextEditingController();
  String _status = "";
  String _receivedMessage = "";

  void _simulateBroadcast(String message) {
    setState(() {
      _status = "Broadcast sent: $message";
      _receivedMessage = message;
    });

    // Show Toast
    Fluttertoast.showToast(
      msg: "Received: $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );

    // Optional: print to console
    print("Broadcast simulated: $message");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Message Broadcaster")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Enter a message to broadcast:", style: TextStyle(fontSize: 16)),
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
                  _simulateBroadcast(text);
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              _status,
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              _receivedMessage.isNotEmpty ? "Displayed on screen: $_receivedMessage" : "",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
