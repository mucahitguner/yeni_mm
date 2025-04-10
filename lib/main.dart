import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'home.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  runApp(const MyApp());
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
