import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
            ListTile(
              leading: Text(""),
              title: Text('Profile', style: TextStyle(color: Colors.white70, fontSize: 13, ),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '../pantallas/user_profile');
              },
            ),
            ListTile(
              leading: Text(""),
              title: Text('Videojuegos', style: TextStyle(color: Colors.white70, fontSize: 13, ),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '../pantallas/game_list');
              },
            ),
            ListTile(
              leading: Text(""),
              title: Text('LGS Store', style: TextStyle(color: Colors.white70, fontSize: 13, ),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '../pantallas/lgs_store');
              },
            ),
            ListTile(
              leading: Text(""),
              title: Text('Acerca de LGS', style: TextStyle(color: Colors.white70, fontSize: 13, ),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '../pantallas/about_us');
              },
            ),
            ListTile(
              leading: Text(""),
              title: Text('Carrito de Compras', style: TextStyle(color: Colors.white70, fontSize: 13, ),),
              onTap: () {
                Navigator.pushReplacementNamed(context, '../pantallas/user_cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
