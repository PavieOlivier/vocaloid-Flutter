import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocaloid/Const.dart';
import 'package:vocaloid/Logic/ArtistManager.dart';
import 'package:vocaloid/Model/Artist.dart';
import 'package:vocaloid/Screen/HomeScreen/ChildWidget/ArtistCard.dart';
import 'package:vocaloid/Screen/HomeScreen/ChildWidget/MusicPlatformCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  //this is where we get the data to display
  //typically it is from the internet but we are doing it local 
  ArtistManager artistManager;
  //to be passed to the artist manager 
  List<Artist> artistList;
  //number of present artist 
  int artistCount = 0;
  //index in the page view 
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.99);
    artistList = [];
    artistManager = ArtistManager(artist: artistList);
    setInit();
  }

  void setInit() async {
    await artistManager.iniArtist().then((value) async {
      artistCount = artistManager.artist.length;
      await artistManager.getAlbum();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(allowFontScaling: true)..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
            decoration: BoxDecoration(
                //color: Colors.pink
                image: DecorationImage(
                    image: AssetImage(artistList[currentIndex].artistImagePath),
                    fit: BoxFit.cover)),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 45, sigmaY: 45),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.65)),
              ),
            ),
          ),
          SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Vocaloid',
                    style: KHomescrenTitleTextStyle.copyWith(
                        fontSize: ScreenUtil.getInstance().setSp(100),
                        color: Colors.pink),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Text(
                    'Select an Artist',
                    style: KHomescrenDescriptionTextStyle.copyWith(
                        fontSize: ScreenUtil.getInstance().setSp(40),
                        color: Colors.pinkAccent),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Container(
                        height: ScreenUtil.getInstance().setHeight(1250),
                        width: ScreenUtil.screenWidth,
                        //color: Colors.yellow,
                        child: PageView.builder(
                          onPageChanged: (index) {
                            currentIndex = index;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          controller: pageController,
                          itemCount: artistCount,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return ArtistCard(
                              artist: artistList[index],
                            );
                          },
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MusicPlatformCard(
                          title: 'Spotify',
                          icon: FontAwesomeIcons.spotify,
                          iconColor: Colors.green[400],
                        ),
                        MusicPlatformCard(
                          title: 'Napster',
                          icon: FontAwesomeIcons.napster,
                          iconColor: Colors.blueAccent,
                        ),
                        MusicPlatformCard(
                          title: 'Sound Cloud',
                          icon: FontAwesomeIcons.soundcloud,
                          iconColor: Colors.orangeAccent,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


