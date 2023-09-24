import 'package:flutter/material.dart';

import 'home_page.dart'; // Importa la pantalla Inicio
import 'user_login.dart'; // Importa la pantalla Inicio
import 'user_register.dart'; // Importa la pantalla Inicio
import 'lgs_store.dart'; // Importa la pantalla Inicio
import 'about_us.dart'; // Importa la pantalla Acerca de Nosotros
import 'game_list.dart'; // Importa la pantalla Lista de Juegos
import 'specific_game.dart'; // Importa la pantalla Juego Específico
import 'specific_item.dart'; // Importa la pantalla específica
import 'tournament_info.dart'; // Importa la pantalla Información del Torneo
import 'tournament_inscription.dart'; // Importa la pantalla Inscripción en el Torneo
import 'user_cart.dart'; // Importa la pantalla Carrito de Usuario
import 'user_payment.dart'; // Importa la pantalla Pago del Usuario
import 'user_profile.dart'; // Importa la pantalla Perfil de Usuario


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGS',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: UserLogIn(),
    );
  }
}