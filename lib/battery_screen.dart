import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryScreen extends StatefulWidget {
  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;

  @override
  void initState() {
    super.initState();
    _initBatteryStream();
    _updateBatteryLevel(); 
  }

  void _initBatteryStream() {
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      
      await _updateBatteryLevel();
    });
  }

  Future<void> _updateBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Battery Percentage'),
      ),
      body: Center(
        child: Text(
          'Battery: $_batteryLevel%',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
