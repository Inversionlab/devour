import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'first.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(null,
  [
    NotificationChannel(channelKey: '1', channelName: 'Welcome', channelDescription:'example'
    ,ledColor: Colors.white,defaultColor: Colors.white,enableVibration: true,
    )
  ]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: first(),
    );

  }
}
