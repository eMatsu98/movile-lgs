import 'package:flutter/material.dart';

class SpecificItem extends StatefulWidget {
  @override
  _SpecificItemState createState() => _SpecificItemState();
}

class _SpecificItemState extends State<SpecificItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Item Específico'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla del item específico!'),
      ),
    );
  }
}
