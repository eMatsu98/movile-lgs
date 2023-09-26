import 'package:counter_provider/home_page.dart';
import 'package:counter_provider/providers/tip_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: ChangeNotifierProvider(
        create: (context) => TipProvider(),
        child: HomePage(),
      ),
    );
  }
}