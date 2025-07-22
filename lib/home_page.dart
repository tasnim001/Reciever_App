import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reciever App")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: Text('Broadcast Receiver'),
              onTap: () => Navigator.pushNamed(context, '/broadcast'),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Image Scale'),
              onTap: () => Navigator.pushNamed(context, '/image'),
            ),
            ListTile(
              leading: Icon(Icons.ondemand_video),
              title: Text('Video Player'),
              onTap: () => Navigator.pushNamed(context, '/video'),
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Audio Player'),
              onTap: () => Navigator.pushNamed(context, '/audio'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Tap on the top left to see options",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
