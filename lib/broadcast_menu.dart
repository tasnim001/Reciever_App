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
      appBar: AppBar(title: const Text("Broadcast Menu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                value: _selectedOption,
                isExpanded: true,
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
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Yellow button
                foregroundColor: Colors.black, // Black text
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text("Select"),
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
