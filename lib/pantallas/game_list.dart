import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgs/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class GameList extends StatelessWidget {
  GameList({
    super.key,
  });

  final List<String> gamesList = [
    'https://www.hollywoodreporter.com/wp-content/uploads/2018/06/super_smash_bros_logo.jpg',
    'https://1000marcas.net/wp-content/uploads/2023/09/Mario-Kart-Logo.jpg',
    'https://s3.amazonaws.com/cdn.wp.m4ecmx/wp-content/uploads/2020/08/28220818/nueva-portada-enero-17.jpg',
    'https://www.leagueoflegends.com/static/open-graph-b580f0266cc3f0589d0dc10765bc1631.jpg',
    'https://cdn.entries.clios.com/styles/clio_aotw_image_panels_retina/s3/entry_attachments/image/51/1420/25982/65469/mguOoDtWxMYF2s7kA8XX_VITDRPUM-zNec7C6wjcJCI.jpg/mguOoDtWxMYF2s7kA8XX_VITDRPUM-zNec7C6wjcJCI.jpg',
    'https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/8576dd65f2747bb24439aa3a051a732c.png',
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
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.125, right: screenWidth*0.125),
              child: Column(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                    gamesList.take(7).map((item) =>
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.5, top: 8.5),
                        child: Container(
                          width: screenWidth * 0.75,
                          height: screenHeight * 0.13,
                          child: IconButton(
                            onPressed: (){},
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                item,
                                fit: BoxFit.cover, width: 1000, height: 1000,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).toList(),
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

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
     child: SideMenu(),
  );
}
