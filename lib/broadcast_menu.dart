import 'package:flutter/material.dart';

class BroadcastMenu extends StatefulWidget {
  @override
  _BroadcastMenuState createState() => _BroadcastMenuState();
}

class _BroadcastMenuState extends State<BroadcastMenu> {
  String _selectedOption = 'Custom';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Broadcast Menu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedOption,
              items: ['Custom', 'Battery'].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Proceed"),
              onPressed: () {
                if (_selectedOption == 'Custom') {
                  Navigator.pushNamed(context, '/custom_input');
                } else {
                  Navigator.pushNamed(context, '/battery');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
