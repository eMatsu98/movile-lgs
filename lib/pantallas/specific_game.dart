import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu
          ), iconSize: 17, color: Colors.white,),
        // title: Text('SUPER SMASH BROS', style: TextStyle(color: Color(0xFFFF0056), fontWeight: FontWeight.w900,),),
        // centerTitle: true,
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 17,),
          Text('SUPER SMASH BROS', style: TextStyle(color: Color(0xFFFF0056), fontSize: 24, fontWeight: FontWeight.w900,),),
          Padding(
            padding: EdgeInsets.only(left: screenWidth*0.15, right: screenWidth*0.15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.125, right: screenWidth*0.125),
                  child: Column(
                    children: [
                      Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Container(
                            height: screenHeight*0.85,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: specificGame.length,
                              itemBuilder: (context, index) {
                                Map<String, String> game = specificGame[index];
                                return/* InkWell(
                                onTap: (){},
                                child:*/ Column(
                                  children: [
                                    Container(
                                      width: 300,
                                      child: Card(
                                        margin: EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(height: 7),
                                              Text("Torneo: ${game['Torneo']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 8),
                                              Text("Fecha: ${game['Fecha']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                                              SizedBox(height: 8),
                                              Text("Hora: ${game['Hora']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                                              SizedBox(height: 8),
                                              Text("Modalidad: ${game['Modalidad']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                                              SizedBox(height: 8),
                                              Text("Precio: ${game['Precio']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                                              SizedBox(height: 8),
                                              Text("Integrantes: ${game['Integrantes']}", style: TextStyle(fontFamily: 'Roboto', fontSize: 15)),
                                              SizedBox(height: 17),
                                              SizedBox(
                                                width: 180,
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
                                              SizedBox(height: 7),
                                            ],
                                          ),
                                        ),
                                        /*),*/
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            icon: Icon(CupertinoIcons.game_controller_solid),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded, color: Colors.white70,),
            label: '',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Color(0xFFFF0056),
        //onTap: _onItemTapped,
      ),
    );
  }
}