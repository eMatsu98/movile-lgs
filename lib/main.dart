import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lgs/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGS',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: WidgetTree(),
    );
  }
}
