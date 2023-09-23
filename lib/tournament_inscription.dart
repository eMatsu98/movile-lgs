import 'package:flutter/material.dart';

class TournamentInscription extends StatefulWidget {
  @override
  _TournamentInscriptionState createState() => _TournamentInscriptionState();
}

class _TournamentInscriptionState extends State<TournamentInscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscripción en el Torneo'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla de inscripción en el torneo!'),
      ),
    );
  }
}
