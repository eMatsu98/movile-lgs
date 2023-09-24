import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      /*
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded), iconSize: 17, color: Colors.white,),
        title: Text('LGS', style: TextStyle(color: Colors.white),),
      ),
      */
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image(image: AssetImage("assets/images/lgs.png")),
            ),
            Text("", style: TextStyle(fontSize: 30)),
            Text('LGS', style: TextStyle(fontFamily: "Arial", color: Color(0xFFFF0056), fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 70,),
            Padding(
              padding: EdgeInsets.only(left: 70.0, right: 70),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    ElevatedButton(
                      onPressed: () {},
                      child:
                        Text('Iniciar Sesión', style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    ElevatedButton(
                      onPressed: () {},
                      child:
                        Text('Registro', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 33, 33, 33)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            side: BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:
        <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller_solid),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded),
            label: '',
          ),
        ],
        //currentIndex: 0,
        selectedItemColor: Color(0xFFFF0056),
        //onTap: _onItemTapped,
      ),
    );
  }
}