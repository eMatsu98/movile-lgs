import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({
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