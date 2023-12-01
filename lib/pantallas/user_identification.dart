import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class UserIdentification extends StatefulWidget {
  UserIdentification({
    super.key,
  });

  @override
  State<UserIdentification> createState() => _UserIdentificationState();
}

class _UserIdentificationState extends State<UserIdentification> {
  bool _login = false;
  bool _register = false;
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();
  final TextEditingController _controllerUser = TextEditingController();

  Stream<List<UserType>> readUsers() => FirebaseFirestore.instance
    .collection('users')
    .snapshots()
    .map((snapshot) =>
      snapshot.docs.map((doc) => UserType.fromJson(doc.data())).toList()
    );

  Future<List<UserType>> categoryList() async {
    return await readUsers().first;
  }

  Future<void> signIn() async {
    try {
      await Auth().signIn(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUser() async {
    if (_controllerUser.text == ''){
      errorMessage = "Favor de ingresar un usuario";
      return;
    }
    if (await validateUser(_controllerUser.text)){
      return;
    }
    if (_controllerPassword.text != _controllerConfirmPassword.text){
      errorMessage = "Las contraseñas no son iguales, por favor corraboralas";
      return;
    }
    try {
      await Auth().createUser(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
    final myUid =   await getUID();
    final docUser = FirebaseFirestore.instance.collection('users').doc(myUid);
    final user = UserType(
      uid: myUid,
      name: _controllerUser.text,
    );
    try{
      await docUser.set(user.toJson());
    } on FirebaseException catch (e) {
      errorMessage = e.message;
    }
  }

  Future<bool> validateUser(currentName) async{
    List<UserType> usersList = await categoryList();
    for (var user in usersList){
      print('user = ${user.name}, current = ${currentName}');
      print(user.name == currentName ? 'Son iguales' : 'No se repite');
      if (user.name == currentName) {
        errorMessage =
            'El usuario "${user.name}" ya existe, favor de intentar con otro';
        return true;
      }
    }
    return false;
  }

  Future<String> getUID() async {
    return Auth().currentUser!.uid;
  }

  Widget _entryField(String title, TextEditingController controller, bool hideText) {
    return SizedBox(
      width: 300,
      height: 37,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        cursorColor: Color(0xFFFF0056),
        obscureText: hideText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(color: Colors.white)),
          hintText: title,
          hintStyle: TextStyle(color: Colors.white70),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFFFF0056),
          )),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Humm ? $errorMessage',
      style: TextStyle(fontSize: 10, color: Color(0xFFFF0056))
    );
  }

  Widget _submitButton(String title) {
    return SizedBox(
      width: 300,
      height: 37,
      child: ElevatedButton(
        onPressed: (){
           _login ? signIn() : createUser();
           setState(() {
             _errorMessage();
           });
        },
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
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
    );
  }

  Widget _banner(){
    setState(() {
      errorMessage = errorMessage;
    });
    return Column(
      children: [
        _errorMessage(),
        SizedBox(
          height: 17,
        ),
        SizedBox(
          height: 37,
          child: Image(image: AssetImage("assets/images/lgs.png")),
        ),
      ],
    );
  }

  Future<void> _resetFlags() async {
    setState(() {
      _login = false;
      _register = false;
    });
  }

  Future<void> _setLogin() async {
    setState(() {
      _login = true;
      _register = false;
    });
  }

  Future<void> _setRegister() async {
    setState(() {
      _register = true;
      _login = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (_login) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _resetFlags();
                },
                child: Icon(Icons.close),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _banner(),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15),
                child: Column(
                  children: <Widget>[
                    _entryField('Correo electrónico', _controllerEmail, false),
                    SizedBox(
                      height: 17,
                    ),
                    _entryField('Contraseña', _controllerPassword, true),
                    SizedBox(
                      height: 37,
                    ),
                    _submitButton('Iniciar Sesión'),
                    SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 37,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "¿No tienes una cuenta? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            TextButton(
                                onPressed: () {
                                  _setRegister();
                                },
                                child: Text(
                                  "Regístrate",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 10),
                                )),
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
    } else if (_register) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _resetFlags();
                },
                child: Icon(Icons.close),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _banner(),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _entryField('Usuario', _controllerUser, false),
                    SizedBox(
                      height: 17,
                    ),
                    _entryField('Correo Electrónico', _controllerEmail, false),
                    SizedBox(
                      height: 17,
                    ),
                    _entryField('Contraseña', _controllerPassword, true),
                    SizedBox(
                      height: 17,
                    ),
                    _entryField('Confirmar Contraseña', _controllerConfirmPassword, true),
                    SizedBox(
                      height: 37,
                    ),
                    _submitButton('Registrarse'),
                    SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 37,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "¿Ya tienes una cuenta? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            TextButton(
                                onPressed: () {
                                  _setLogin();
                                },
                                child: Text(
                                  "Inicia Sesión",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 10),
                                )),
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
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Términos y Condiciones.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: 9),
                  )),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(image: AssetImage("assets/images/lgs.png")),
                    ),
                    Text("", style: TextStyle(fontSize: 30)),
                    Text(
                      'LGS',
                      style: TextStyle(
                          fontFamily: "Arial",
                          color: Color(0xFFFF0056),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 37,
                          child: ElevatedButton(
                            onPressed: () {
                              _setLogin();
                            },
                            child: Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  side: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: 300,
                          height: 37,
                          child: ElevatedButton(
                            onPressed: () {
                              _setRegister();
                            },
                            child: Text(
                              'Registro',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 33, 33, 33)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    side: BorderSide(color: Colors.white)),
                              ),
                            ),
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
      );
    }
  }
}

class UserType {
  String uid;
  final String name;

  UserType({
    required this.uid,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
  };

  static UserType fromJson(Map<String, dynamic> json) => UserType(
    uid: json['uid'],
    name: json['name'],
    );
}
