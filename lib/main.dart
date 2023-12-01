import 'package:flutter/material.dart';
import '/widgets/side_menu.dart';

import '/pantallas/home_page.dart'; // Importa la pantalla Inicio
import '/pantallas/front_page.dart'; // Importa la pantalla Front
import '/pantallas/user_register.dart'; // Importa la pantalla Registro
import '/pantallas/user_login.dart'; // Importa la pantalla Login
import '/pantallas/lgs_store.dart'; // Importa la pantalla Store
import '/pantallas/about_us.dart'; // Importa la pantalla Acerca de Nosotros
import '/pantallas/game_list.dart'; // Importa la pantalla Lista de Juegos
import '/pantallas/specific_game.dart'; // Importa la pantalla Juego Específico
import '/pantallas/specific_item.dart'; // Importa la pantalla específica
import '/pantallas/user_cart.dart'; // Importa la pantalla Carrito de Usuario
import '/pantallas/user_payment.dart'; // Importa la pantalla Pago del Usuario
import '/pantallas/user_profile.dart'; // Importa la pantalla Perfil de Usuario

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGS',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: UserCart(),
    );
  }
}