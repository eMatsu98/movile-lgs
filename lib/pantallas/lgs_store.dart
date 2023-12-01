import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LgsStore extends StatelessWidget {
  LgsStore({
    super.key,
  });

  final List<String> productList = [
    'https://ae01.alicdn.com/kf/HTB1f3tAx.R1BeNjy0Fmq6z0wVXau/Kids-Clothes-T-Shirt-Super-Smash-Bros-Mario-Link-Star-Fox-Pikachu-Children-T-shirt-for.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
    'https://m.media-amazon.com/images/I/51dA-Z16pmL._AC_UF894,1000_QL80_.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
    'https://ae01.alicdn.com/kf/HTB1f3tAx.R1BeNjy0Fmq6z0wVXau/Kids-Clothes-T-Shirt-Super-Smash-Bros-Mario-Link-Star-Fox-Pikachu-Children-T-shirt-for.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
    'https://m.media-amazon.com/images/I/51dA-Z16pmL._AC_UF894,1000_QL80_.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
    'https://ae01.alicdn.com/kf/HTB1f3tAx.R1BeNjy0Fmq6z0wVXau/Kids-Clothes-T-Shirt-Super-Smash-Bros-Mario-Link-Star-Fox-Pikachu-Children-T-shirt-for.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
    'https://m.media-amazon.com/images/I/51dA-Z16pmL._AC_UF894,1000_QL80_.jpg',
    'https://www.okiwoki.com/images_ap/mc/765-63-110-1619739521547-kart-fighter-player-5_680.png',
    'https://ae01.alicdn.com/kf/Sc9cb381c42974a6ab4741aba5e206ac9R/10-50Pcs-Vintage-Video-Game-Stickers-for-Laptop-Skateboard-Motor-Bike-Car-Fridge-Guitar-Waterproof-Sticker.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Tienda LGS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Guardar perfil
            },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 17,),
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 17),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 13,),
                cursorColor: Color(0xFFFF0056),
                decoration: InputDecoration(
                  hintText: 'Buscar artículo',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                  suffixIcon: Icon(Icons.search, color: Colors.white, size: 15,),
                  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
                  enabledBorder: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  width: screenWidth*0.7,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        header: GridTileBar(
                          backgroundColor: Color.fromARGB(33, 224, 224, 224),
                          title: Text('Product ${index + 1}', style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),),
                        ),
                        footer: GridTileBar(
                          backgroundColor: Color.fromARGB(150, 33, 33, 33),
                          title: Text('\$ ${index + 1}.${(index + 1)*11}', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold,),),
                          trailing: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.white, size: 18,),
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 37),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            productList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
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
            icon: Icon(Icons.shopping_bag_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller_solid, color: Colors.white70,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_rounded, color: Colors.white70,),
            label: '',
          ),
        ],
        currentIndex: 1,
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
