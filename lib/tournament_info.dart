import 'package:flutter/material.dart';

class TournamentInfo extends StatefulWidget {
  @override
  _TournamentInfoState createState() => _TournamentInfoState();
}

class _TournamentInfoState extends State<TournamentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Torneo'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla de información del torneo!'),
      ),
    );
  }
}
