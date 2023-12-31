import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgs/auth.dart';
import 'package:lgs/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });
  
  final User? user = Auth().currentUser;
  
  Future<void> signOut() async {
    await Auth().signOut();
  }
  

  Widget _userUid() {
    return Text(user?.uid ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  }
  
  final ValueNotifier<int> _current = ValueNotifier<int>(0);

  final List<String> bannerList = [
    'https://live.staticflickr.com/1754/27888712227_f127efb0da_b.jpg',
    'https://live.staticflickr.com/1754/27888712227_f127efb0da_b.jpg',
    'https://live.staticflickr.com/1754/27888712227_f127efb0da_b.jpg',
  ];
  final List<String> productList = [
    'https://members.asicentral.com/media/24234/cr-range.jpg',
    'https://members.asicentral.com/media/24234/cr-range.jpg',
    'https://members.asicentral.com/media/24234/cr-range.jpg',
    'https://members.asicentral.com/media/24234/cr-range.jpg',
  ];
  final List<String> newsList = [
    'https://images.hindustantimes.com/tech/img/2022/12/13/960x540/FILES-JAPAN-HEALTH-GAMES-ADDICTION-0_1670937891564_1670937891564_1670937919379_1670937919379.jpg',
    'https://images.hindustantimes.com/tech/img/2022/12/13/960x540/FILES-JAPAN-HEALTH-GAMES-ADDICTION-0_1670937891564_1670937891564_1670937919379_1670937919379.jpg',
    'https://images.hindustantimes.com/tech/img/2022/12/13/960x540/FILES-JAPAN-HEALTH-GAMES-ADDICTION-0_1670937891564_1670937891564_1670937919379_1670937919379.jpg',
    'https://images.hindustantimes.com/tech/img/2022/12/13/960x540/FILES-JAPAN-HEALTH-GAMES-ADDICTION-0_1670937891564_1670937891564_1670937919379_1670937919379.jpg',
    'https://images.hindustantimes.com/tech/img/2022/12/13/960x540/FILES-JAPAN-HEALTH-GAMES-ADDICTION-0_1670937891564_1670937891564_1670937919379_1670937919379.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _userUid(),
            // _signOutButton(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CarouselSlider(
                          items: bannerList.map((item) =>
                            Container(
                              child: Center(
                                child: Image.network(item,
                                  fit: BoxFit.cover, width: 1000, height: 1000,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                          options: CarouselOptions(
                            height: screenHeight*0.2,
                            autoPlay: true,
                            aspectRatio: 16/9,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              _current.value = index;
                            },
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: screenHeight*0.17,),
                          ValueListenableBuilder<int>(
                            valueListenable: _current,
                            builder: (context, value, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: bannerList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => _current.value = entry.key,
                                    child: Container(
                                      width: 7.0,
                                      height: 7.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness == Brightness.dark
                                                ? Colors.white
                                                : Colors.black87)
                                            .withOpacity(
                                                _current.value == entry.key ? 0.7 : 0.3),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 37,),
                  Text('Lo más vendido', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                  SizedBox(height: 17,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                    productList.take(3).map((item) =>
                      Container(
                        width: screenWidth * 0.2,
                        height: screenWidth * 0.2,
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 37,),
                  Text('Noticias', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),),
                  SizedBox(height: 17,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: newsList.take(2).map((item) =>
                          Container(
                            width: screenWidth * 0.3,
                            height: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                      SizedBox(height: 17,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: newsList.skip(2).take(2).map((item) =>
                          Container(
                            width: screenWidth * 0.3,
                            height: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ).toList(),
                      ),
                    ],
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
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded, color: Colors.white70,),
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
        //currentIndex: 0,
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