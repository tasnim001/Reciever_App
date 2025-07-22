import 'package:flutter/material.dart';
import 'home_page.dart';
import 'broadcast_menu.dart';
import 'custom_input.dart';
import 'receiver.dart';
import 'battery_screen.dart';
import 'image_scale.dart';
import 'video_screen.dart';
import 'audio_screen.dart';
import 'custom_receiver.dart';

void main() {
  runApp(MaterialApp(
    title: 'Broadcast Receiver App',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/broadcast': (context) => BroadcastMenu(),
      '/custom_input': (context) => CustomInput(),
      '/custom_receiver': (context) => CustomReceiverScreen(),
      '/receiver': (context) => Receiver(),
      '/battery': (context) => BatteryScreen(),
      '/image': (context) => ImageScaleScreen(),
      '/video': (context) => VideoScreen(),
      '/audio': (context) => AudioScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
