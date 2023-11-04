import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(left: 70.0, right: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Usuario", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7,),
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Color(0xFFFF0056),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)), borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Text("Correo Electrónico", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7,),
                  SizedBox(
                    width: 300,
                    height: 37,
                    child: 
                    TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Color(0xFFFF0056),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7)), borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Text("Contraseña", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7,),
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
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
                      ),
                    ),
                  ),
                  SizedBox(height: 17,),
                  Text("Confirmar Contraseña", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7,),
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
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
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
                        Text('Registarse', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
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
                          Text("¿Ya tienes una cuenta? ", style: TextStyle(color: Colors.white, fontSize: 10),),
                          TextButton(onPressed: (){}, child: Text("Inicia Sesión", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),)),
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

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        height: 50.0,
        color: Colors.grey[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: (){}, child: Text("Términos y Condiciones.", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70, fontSize: 9),)),
          ],
        ),
      ),
    );
  }
}