import 'package:flutter/material.dart';

class UserPayment extends StatefulWidget {
  @override
  _UserPaymentState createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pago del Usuario'),
      ),
      body: Center(
        child: Text('¡Esta es la pantalla de pago del usuario!'),
      ),
    );
  }
}
