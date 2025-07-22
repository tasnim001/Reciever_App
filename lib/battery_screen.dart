import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

class BatteryScreen extends StatefulWidget {
  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  late BroadcastReceiver _receiver;
  int _battery = -1;

  @override
  void initState() {
    super.initState();

    _receiver = BroadcastReceiver(names: ['android.intent.action.BATTERY_CHANGED']);
    _receiver.messages.listen((msg) {
      final data = msg.data;
      final level = data?['level'];
      final scale = data?['scale'];

      if (level != null && scale != null) {
        setState(() => _battery = ((level / scale) * 100).round());
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
      appBar: AppBar(title: Text("Battery Status")),
      body: Center(
        child: Text(
          _battery >= 0
              ? "Battery Level: $_battery%"
              : "Listening for battery updates...",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
