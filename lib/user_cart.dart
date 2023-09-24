import 'package:flutter/material.dart';

class UserCart extends StatefulWidget {
  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
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
