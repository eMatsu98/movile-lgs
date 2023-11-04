import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserLogIn extends StatelessWidget {
  const UserLogIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded), iconSize: 17, color: Color(0xFFFF0056),),
        title: SizedBox(
          height: 30,
          child: Image(image: AssetImage("assets/images/lgs.png")),
        ),
        */
        actions: [Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.close),
        )],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("", style: TextStyle(fontSize: 10)),
            SizedBox(
              height: 37,
              child: Image(image: AssetImage("assets/images/lgs.png")),
            ),
            SizedBox(height: 70,),
            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.15, right: screenWidth*0.15),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Color(0xFFFF0056),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)), borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(color: Colors.white70),
                        //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Color(0xFFFF0056),
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)), borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(color: Colors.white70),
                        //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF0056),)),
                      ),
                    ),
                  ),
                  SizedBox(height: 37,),
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    ElevatedButton(
                      onPressed: () {},
                      child:
                        Text('Iniciar Sesión', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF0056)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            side: BorderSide(color: Color(0xFFFF0056)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 37,),
                  SizedBox(height: 37,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text("¿No tienes una cuenta? ", style: TextStyle(color: Colors.white, fontSize: 10),),
                          TextButton(onPressed: (){}, child: Text("Regístrate", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}