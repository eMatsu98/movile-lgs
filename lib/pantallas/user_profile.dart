import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lgs/auth.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UserProfile extends StatefulWidget {
  UserProfile({
    super.key,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

bool _editing = false;

class _UserProfileState extends State<UserProfile> {
  ImageProvider _currentImage = AssetImage("assets/images/user.png");
  bool _defaultImage = true;

  Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;
    setState(() {
      _currentImage = FileImage(File(image.path));
      _defaultImage = false;
    });
  }

  Future _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;
    setState(() {
      _currentImage = FileImage(File(image.path));
      _defaultImage = false;
    });
  }

  Future _setDefaultImage() async {
    setState(() {
      _currentImage = AssetImage("assets/images/user.png");
      _defaultImage = true;
    });
  }

  Future<void> _showCameraOptionsDefault(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF181818),
          title: Text(
            'Seleccionar opción',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF0056),
                  ),
                  child: Text('Tomar foto'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF0056),
                  ),
                  child: Text('Elegir de la galería'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showCameraOptions(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF181818),
          title: Text(
            'Seleccionar opción',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF0056),
                  ),
                  child: Text('Tomar foto'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF0056),
                  ),
                  child: Text('Elegir de la galería'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _setDefaultImage();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF0056),
                  ),
                  child: Text('Eliminar imagen'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _userUid() {
    return TextFormField(
      initialValue: user?.email ?? 'Username',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      cursorColor: Color(0xFFFF0056),
    );
    // return Text(user?.uid ?? 'User email');
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget ShowField(String title, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
      SizedBox(
        width: 300,
        height: 37,
        child: TextFormField(
          initialValue: value,
          style: TextStyle(color: Colors.white),
          cursorColor: Color(0xFFFF0056),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Colors.white70),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFFF0056),
            )),
          ),
        ),
      )
    ]);
  }

  Future<void> FindUser() async {
    List<UserType> usersList = await categoryList();
    // String currentUID = user!.uid;
    userEmail = user?.email ?? 'User email';
    print(
        '-------------------------->FINDING USER<----------------------------');
    for (var user in usersList) {
      // if (user.uid == currentUID) userData = user;
      // return;
    }
    userData = UserType(uid: '0000', name: 'User');
  }

  final User? user = Auth().currentUser;

  String userEmail = '';
  UserType userData = UserType(uid: '0000', name: 'User');

  Stream<List<UserType>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserType.fromJson(doc.data())).toList());

  Future<List<UserType>> categoryList() async {
    return await readUsers().first;
  }

  Widget _signOutButton() {
    // return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'), style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF0056)),
    //   ),);
    return ElevatedButton(
      onPressed: signOut,
      child: Text(
        "Cerrar Sesión",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    FindUser();

    if (_editing) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                // Guardar perfil
                setState(() {
                  _editing = false;
                });
              },
              child: Text(
                'Guardar',
                style: TextStyle(
                    color: Colors.white /*Color(0xFFFF0056)*/,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
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
                        // _selectedImage != null ? FileImage(_selectedImage!) : NetworkImage('');
                        image:
                            _currentImage, //FileImage(_selectedImage!),//NetworkImage('https://marketplace.canva.com/EAFqNrAJpQs/1/0/1600w/canva-neutral-pink-modern-circle-shape-linkedin-profile-picture-WAhofEY5L1U.jpg'), // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          initialValue: userData.name,
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
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowField('Usuario', userData.name),
                            SizedBox(
                              height: 37,
                            ),
                            ShowField('Correo Electrónico', userEmail),
                            SizedBox(
                              height: 37,
                            ),
                            ShowField('Contraseña', ''),
                            SizedBox(
                              height: 37,
                            ),
                            ShowField('Confirmar Contraseña', ''),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        height: 37,
                        child:
                            Image(image: AssetImage("assets/images/lgs.png")),
                      ),
                      SizedBox(
                        height: 70,
                      ),
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
                            _defaultImage
                                ? _showCameraOptionsDefault(context)
                                : _showCameraOptions(context);
                          },
                          child: Icon(Icons.camera_alt_rounded),
                          backgroundColor: Color(0xFFFF0056),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 570,
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _editing = true;
                });
              },
              child: Text(
                'Editar',
                style: TextStyle(
                    color: Colors.white /*Color(0xFFFF0056)*/,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
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
                        // _selectedImage != null ? FileImage(_selectedImage!) : NetworkImage('');
                        image:
                            _currentImage, //FileImage(_selectedImage!),//NetworkImage('https://marketplace.canva.com/EAFqNrAJpQs/1/0/1600w/canva-neutral-pink-modern-circle-shape-linkedin-profile-picture-WAhofEY5L1U.jpg'), // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: _userUid(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Usuario",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 300,
                              height: 37,
                              child: TextFormField(
                                initialValue: 'Emilio',
                                style: TextStyle(color: Colors.white),
                                cursorColor: Color(0xFFFF0056),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xFFFF0056),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 37,
                            ),
                            Text("Correo Electrónico",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 300,
                              height: 37,
                              child: TextFormField(
                                initialValue: 'emilio@hotmail.com',
                                style: TextStyle(color: Colors.white),
                                cursorColor: Color(0xFFFF0056),
                                decoration: InputDecoration(
                                  // labelText: 'Correo Electrónico',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  // hintText: 'Correo electrónico',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xFFFF0056),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 37,
                            ),
                            Text("Contraseña",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 300,
                              height: 37,
                              child: TextFormField(
                                initialValue: '1234567',
                                style: TextStyle(color: Colors.white),
                                cursorColor: Color(0xFFFF0056),
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  // hintText: 'Contraseña',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xFFFF0056),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 37,
                            ),
                            Text("Confirmar Contraseña",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 300,
                              height: 37,
                              child: TextFormField(
                                initialValue: '1234567',
                                style: TextStyle(color: Colors.white),
                                cursorColor: Color(0xFFFF0056),
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  // hintText: 'Contraseña',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  //labelStyle: TextStyle(color: Color(0xFFFF0056)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xFFFF0056),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 300,
                        height: 37,
                        child: _signOutButton(),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SideMenu(),
      );
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
