import 'package:flutter/material.dart';
import 'package:lgs/pantallas/about_us.dart';
import 'package:lgs/pantallas/game_list.dart';
import 'package:lgs/pantallas/home_page.dart';
import 'package:lgs/pantallas/lgs_store.dart';
import 'package:lgs/pantallas/user_cart.dart';
import 'package:lgs/pantallas/user_profile.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget Browse(String title, BuildContext cont, Widget page) {
      return ListTile(
        leading: Text(""),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
        onTap: () {
          Navigator.of(cont).pushReplacement(MaterialPageRoute(
            builder: (cont) => page,
          ));
        },
      );
    }

    return SizedBox(
      width: screenWidth * 0.3,
      child: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'M E N U',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Browse("Inicio", context, HomePage()),
            Browse("Profile", context, UserProfile()),
            Browse("Videojuegos", context, GameList()),
            Browse("LGS Store", context, LgsStore()),
            Browse("Acerca de LGS", context, AboutUs()),
            Browse("Carrito de Compras", context, UserCart()),
          ],
        ),
      ),
    );
  }
}
