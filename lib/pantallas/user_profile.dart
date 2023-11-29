import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UserProfile extends StatelessWidget {
  UserProfile({
    super.key,
  });

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
        //title: Text('LGS', style: TextStyle(color: Colors.white),),
        actions: [
          TextButton(
            onPressed: () {
              // Guardar perfil
            },
            child: Text('Guardar', style: TextStyle(color: Colors.white/*Color(0xFFFF0056)*/, fontSize: 17, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      drawer: SideMenu(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  // height: screenHeight*0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://marketplace.canva.com/EAFqNrAJpQs/1/0/1600w/canva-neutral-pink-modern-circle-shape-linkedin-profile-picture-WAhofEY5L1U.jpg'), // Replace with your image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TextFormField(
                        initialValue: 'Ana Aguilar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        cursorColor: Color(0xFFFF0056),
                      ),
                    ),
                  ),
                ),
              ),
              
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 70,),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth*0.15, right: screenWidth*0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Usuario", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 300,
                            height: 37,
                            child: 
                            TextFormField(
                              initialValue: 'GrizzlyFreak7',
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xFFFF0056),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                hintStyle: TextStyle(color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 37,),
                          Text("Correo Electrónico", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 300,
                            height: 37,
                            child: 
                            TextFormField(
                              initialValue: 'is726532@iteso.mx',
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xFFFF0056),
                              decoration: InputDecoration(
                                // labelText: 'Correo Electrónico',
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                // hintText: 'Correo electrónico',
                                hintStyle: TextStyle(color: Colors.white70),
                                //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 37,),
                          Text("Contraseña", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 300,
                            height: 37,
                            child:
                            TextFormField(
                              initialValue: '1234567',
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xFFFF0056),
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                // hintText: 'Contraseña',
                                hintStyle: TextStyle(color: Colors.white70),
                                //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 37,),
                          Text("Confirmar Contraseña", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 300,
                            height: 37,
                            child:
                            TextFormField(
                              initialValue: '1234567',
                              style: TextStyle(color: Colors.white),
                              cursorColor: Color(0xFFFF0056),
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                // hintText: 'Contraseña',
                                hintStyle: TextStyle(color: Colors.white70),
                                //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 37,),
                    SizedBox(height: 37,),
                    SizedBox(height: 17,),
                    SizedBox(
                      height: 37,
                      child: Image(image: AssetImage("assets/images/lgs.png")),
                    ),
                    SizedBox(height: 70,),
                  ],
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 17.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          // Subir foto
                        },
                        child: Icon(Icons.camera_alt_rounded),
                        backgroundColor: Color(0xFFFF0056),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 570,),
            ],
          ),
        ],
      ),
    );
  }
}