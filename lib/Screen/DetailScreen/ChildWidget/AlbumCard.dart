import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaloid/Const.dart';

class AlbumCard extends StatelessWidget {
  final String albumTitle;
  final String albumImagePath;
  final Color albumTitleColor;
  const AlbumCard({
    Key key, @required this.albumTitle, @ required this.albumImagePath, this.albumTitleColor = Colors.blueAccent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              width: ScreenUtil.instance.setWidth(400),
              height: ScreenUtil.instance.setHeight(400),
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(albumImagePath,),fit: BoxFit.cover)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.red,
              width: ScreenUtil.instance.setWidth(390),
              height: (MediaQuery.of(context).size.height/100)*4,
              child: Center(
                child: AutoSizeText(albumTitle,textAlign: TextAlign.center,style: KdetailScreenAlbumTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(50),
                  color: albumTitleColor
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

