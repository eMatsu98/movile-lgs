import 'package:flutter/material.dart';

class SpecificItem extends StatelessWidget {
  SpecificItem({
    super.key,
  });
  
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
