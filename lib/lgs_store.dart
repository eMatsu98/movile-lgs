import 'package:flutter/material.dart';

class LgsStore extends StatelessWidget {
  const LgsStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}