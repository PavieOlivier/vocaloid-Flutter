import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaloid/Model/Artist.dart';
import 'ChildWidget/AlbumCardView.dart';
import 'ChildWidget/BasicCharacterDetails.dart';

class DetailScreen extends StatefulWidget {
  final Artist artist;

  const DetailScreen({Key key, @required this.artist}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  AnimationController fadeAnimationController,
      fadeAnimationController1,
      fadeAnimationController2;
  Animation<double> fadeAnimation, fadeAnimation1, fadeAnimation2;
  @override
  void initState() {
    super.initState();
    fadeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    fadeAnimationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 280));
    fadeAnimationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 260));
    //Maybe not the best way of doing this lol
    fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(fadeAnimationController);
    fadeAnimation1 =
        Tween(begin: 0.0, end: 1.0).animate(fadeAnimationController1);
    fadeAnimation2 =
        Tween(begin: 0.0, end: 1.0).animate(fadeAnimationController2);
    fadeAnimationController.forward().then((f) {
      fadeAnimationController1.forward().then((f) {
        fadeAnimationController2.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: -130,
            bottom: 0,
            left: 100,
            child: FadeTransition(
              opacity: fadeAnimation2,
              child: Container(
                height: ScreenUtil.screenHeight,
                width: ScreenUtil.screenWidth,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage(widget.artist.artistImagePath),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black.withOpacity(0.056),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 8,
            right: 8,
            child: FadeTransition(
                opacity: fadeAnimation,
                child: AlbumCardView(
                  artist: widget.artist,
                )),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: FadeTransition(
                  opacity: fadeAnimation1,
                  child: BasicCharacterDetails(
                    character: widget.artist,
                    onReturnPressed: () {
                      fadeAnimationController2.reverse().then((f) {
                        fadeAnimationController1.reverse().then((f) {
                          fadeAnimationController.reverse().then((f) {
                            Navigator.pop(context);
                          });
                        });
                      });
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}