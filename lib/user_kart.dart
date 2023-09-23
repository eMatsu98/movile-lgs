import 'package:flutter/material.dart';

class UserKart extends StatefulWidget {
  @override
  _UserKartState createState() => _UserKartState();
}

class _UserKartState extends State<UserKart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Usuario'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla del carrito de usuario!'),
      ),
    );
  }
}
