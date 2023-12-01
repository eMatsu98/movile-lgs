import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SpecificGame extends StatelessWidget {
  SpecificGame({
    super.key,
  });

  final List<Map<String, String>> specificGame = [
    {
      'Torneo': 'Uno',
      'Fecha': '01/12/2023',
      'Hora': ' 7:00 pm.',
      'Modalidad': 'Virtual',
      'Precio': '\$ 1,300',
      'Integrantes': '3',
    },
    {
      'Torneo': 'Dos',
      'Fecha': '18/01/2024',
      'Hora': ' 3:00 pm.',
      'Modalidad': 'Presencial',
      'Precio': '\$ 700',
      'Integrantes': '1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text('SUPER SMASH BROS', style: TextStyle(color: Color(0xFFFF0056), fontWeight: FontWeight.w900,),),
        // centerTitle: true,
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 17,),
            Text('SUPER SMASH BROS', style: TextStyle(color: Color(0xFFFF0056), fontSize: 24, fontWeight: FontWeight.w900,),),
            SizedBox(height: 37,),
            Expanded(
              child: Container(
                width: 240,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: specificGame.length,
                  itemBuilder: (context, index) {
                    Map<String, String> game = specificGame[index];
                    return/* InkWell(
                    onTap: (){},
                    child:*/ Container(
                      width: 270,
                      child: Card(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 13),
                            Text("Torneo: ${game['Torneo']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 7),
                            Text("Fecha: ${game['Fecha']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                            SizedBox(height: 7),
                            Text("Hora: ${game['Hora']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                            SizedBox(height: 7),
                            Text("Modalidad: ${game['Modalidad']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                            SizedBox(height: 7),
                            Text("Precio: ${game['Precio']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                            SizedBox(height: 7),
                            Text("Integrantes: ${game['Integrantes']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                            SizedBox(height: 13),
                            SizedBox(
                              width: 210,
                              height: 37,
                              child: 
                              ElevatedButton(
                                onPressed: () {},
                                child:
                                  Text('Inscribirse', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF0056)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                      side: BorderSide(color: Color(0xFFFF0056)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 13),
                          ],
                        ),
                        /*),*/
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey[900],
        items:
        <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.white70,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded, color: Colors.white70,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller_solid, color: Colors.white70,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded),
            label: '',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Color(0xFFFF0056),
        //onTap: _onItemTapped,
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SideMenu(),
      );
}
