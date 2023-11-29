import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/widgets/side_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AboutUs extends StatelessWidget {
  AboutUs({
    super.key,
  });

  final ValueNotifier<int> _current = ValueNotifier<int>(0);

  // final VideoPlayerController videoPlayerController = VideoPlayerController.networkUrl(
  //   Uri.parse('https://youtu.be/pupll3ON-WA?si=LW638amJmuSVHw9M'),
  // );

  TextEditingController textController = TextEditingController();

  final List<VideoPlayerController> videosList = [
    VideoPlayerController.networkUrl(Uri.parse('https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4'),),
    VideoPlayerController.networkUrl(Uri.parse('https://youtu.be/pupll3ON-WA?si=LW638amJmuSVHw9M'),),
    VideoPlayerController.networkUrl(Uri.parse('https://youtu.be/pupll3ON-WA?si=LW638amJmuSVHw9M'),),
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
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu
          ), iconSize: 17, color: Colors.white,),
        title: Text('¿Quiénes Somos?', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.15, right: screenWidth*0.15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CarouselSlider(
                          items: videosList.map((item) => 
                            Container(
                              child: Center(
                                child: VideoPlayer(item),
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
                                children: videosList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => _current.value = entry.key,
                                    child: Container(
                                      width: 7.0,
                                      height: 7.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Colors.white)
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
                  SizedBox(height: 17,),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white, // You need to set a color for the TextSpan
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Somos un grupo de personas apasionadas por los  '),
                        TextSpan(text: 'videojuegos', style: TextStyle(color: Color(0xFFFF0056), fontSize: 13, fontWeight: FontWeight.bold),),
                        TextSpan(text: ', con el objetivo de crear la '),
                        TextSpan(text: 'comunidad gamer más grande de México', style: TextStyle(color: Color(0xFFFF0056), fontSize: 13, fontWeight: FontWeight.bold),),
                        TextSpan(text: '.\nPor medio de ligas, torneos y eventos queremos promover la competitividad, la diversión y la colaboración.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 37,),
                  SizedBox(height: 37,),
                  Text('Síguenos y sé parte\nde la comunidad', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: 17,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                    <Widget>[
                      Container(
                        width: screenWidth * 0.17,
                        height: screenWidth * 0.17,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
                          onPressed: () {
                            // FB
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.17,
                        height: screenWidth * 0.17,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.instagram, color: Colors.white),
                          onPressed: () {
                            // instagram
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.17,
                        height: screenWidth * 0.17,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.discord, color: Colors.white),
                          onPressed: () {
                            // discord
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.17,
                        height: screenWidth * 0.17,
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.tiktok, color: Colors.white),
                          onPressed: () {
                            // tiktok
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 37,),
                  Text('Comparte', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          Clipboard.setData(
                            ClipboardData(text: 'link'))
                            .then(
                            (value) {
                              return ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('¡link copiado!'),
                                ),
                              );
                            },
                          );
                        },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                        child: Text("link", style: TextStyle(color: Colors.white, fontSize: 13),)
                      ),
                      IconButton(
                        onPressed: () async {
                          Clipboard.setData(
                            ClipboardData(text: 'link'))
                            .then(
                            (value) {
                              return ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('¡link copiado!'),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.share, color: Colors.white, size: 17),
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