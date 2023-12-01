import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class UserCart extends StatelessWidget {
  UserCart({
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
        title: Text('Carrito', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900,),),
        centerTitle: true,
      ),
      drawer: NavigationDrawer(),
      body: Center( // Center the content horizontally
        child: Container(
          width: screenWidth * 0.7, // Set the width to 70% of the screen width
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Number of items in the cart
                  itemBuilder: (context, index) {
                    // Replace with your custom cart item widget
                    return ListTile(
                      leading: Icon(Icons.image, color: Colors.white,),
                      title: Text('Producto', style: TextStyle(color: Colors.white,),),
                      subtitle: Text('Detalles', style: TextStyle(color: Colors.white,),),
                      trailing: Text('3        \$ 100.00', style: TextStyle(color: Colors.white,),),
                    );
                  },
                ),
              ),
              Divider(color: Colors.white70,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
                    Text('\$ 900.00', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child:
                    Column(
                      children: [
                        SizedBox(height: 7,),
                        Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF0056)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Color(0xFFFF0056)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
