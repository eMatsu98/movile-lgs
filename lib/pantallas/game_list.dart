import 'package:flutter/material.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Juegos'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla de la lista de juegos!'),
      ),
    );
  }
}
