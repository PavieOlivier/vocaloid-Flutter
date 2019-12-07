import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaloid/Const.dart';

class MusicPlatformCard extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String title;
  final Color iconColor;
  const MusicPlatformCard({
    Key key, this.onTap , @required this.icon, @required this.title, @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
          child: Card(
            elevation: 0.6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
                            child: Container(
          height: ScreenUtil.getInstance().setHeight(230),
          width: (MediaQuery.of(context).size.width/100)*25,//ScreenUtil.getInstance().setWidth(300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(bottom: 10),
                   child: Icon(icon, size: 50,color: iconColor,),
                 ),
                
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(title, style: KMusicPlatformCard.copyWith(
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(40),
                  fontWeight: FontWeight.bold,
                  color: iconColor
                ),),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
