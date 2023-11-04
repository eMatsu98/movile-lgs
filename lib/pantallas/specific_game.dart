import 'package:flutter/material.dart';

class SpecificGame extends StatefulWidget {
  @override
  _SpecificGameState createState() => _SpecificGameState();
}

class _SpecificGameState extends State<SpecificGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juego Específico'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla del juego específico!'),
      ),
    );
  }
}
