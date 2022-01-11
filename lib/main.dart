import 'package:flutter/material.dart';
import 'package:intesasoft_demo/views/home/home_view.dart';

import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        title: 'IntesaSoft',
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: HomeView()),
      ),
    );
  }
}
