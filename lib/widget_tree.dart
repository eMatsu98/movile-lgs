import 'package:flutter/material.dart';
import 'package:lgs/pantallas/user_identification.dart';
import 'package:lgs/pantallas/user_profile.dart';

import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UserProfile();
          } else {
            return UserIdentification();
          }
        });
  }
}
