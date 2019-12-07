import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaloid/Const.dart';
import 'package:vocaloid/Model/Artist.dart';
import 'package:vocaloid/Screen/DetailScreen/ChildWidget/AlbumCard.dart';

class AlbumCardView extends StatelessWidget {
  final Artist artist;
  const AlbumCardView({
    Key key, @required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
      child: Container(
        height: ScreenUtil.instance.setHeight(700),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[200]),
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18),
              child: Text(
                'Albums',
                style: KdetailScreenBasicsTextStyle.copyWith(
                    fontSize: ScreenUtil.instance.setSp(60),
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: (MediaQuery.of(context).size.height/100)*28,//ScreenUtil.instance.setHeight(500),
                //color: Colors.green,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: artist.albums.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return  AlbumCard(
                      albumTitleColor: artist.artistPredominantColor,
                      albumImagePath: artist.albums[index].albumImagePath,
                      albumTitle: artist.albums[index].albumTitle,
                    );
                  },),
              ),
            )
          ],
        ),
      ),
    );
  }
}

