import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocaloid/Const.dart';
import 'package:vocaloid/Model/Artist.dart';

class BasicCharacterDetails extends StatelessWidget {
  final Function onReturnPressed;
  final Artist character;
  const BasicCharacterDetails({
    Key key, @required this.character, @required this.onReturnPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: ScreenUtil.instance.setWidth(420),
        height: ScreenUtil.instance.setHeight(1070),
        //color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.redAccent.withOpacity(0.95)
              ),
              child:
                  IconButton(
                    
                onPressed: onReturnPressed,
                icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.white,)
              ),
              
                
              
            ),
            Text(
              'Nane',
              style: KdetailScreenBasicsTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(60),
                  color: Colors.red),
            ),
            Text(
              character.artistName,
              style: KdetailScreenBasicsValueTextStyle.copyWith(
                fontSize: ScreenUtil.instance.setSp(60),
                color: character.artistPredominantColor
              ),
            ),
            Text(
              'Age',
              style: KdetailScreenBasicsTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(60),color: Colors.red),
                  
            ),
            Text(
              character.artistAge,
              style: KdetailScreenBasicsValueTextStyle.copyWith(
                fontSize: ScreenUtil.instance.setSp(60),
                color: character.artistPredominantColor
              ),
            ),
            Text(
              'Height',
              style: KdetailScreenBasicsTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(60),color: Colors.red),
            ),
            Text(
              character.artistHeight,
              style: KdetailScreenBasicsValueTextStyle.copyWith(
                fontSize: ScreenUtil.instance.setSp(52),
                color: character.artistPredominantColor
              ),
            ),
            Text(
              'Weight',
              style: KdetailScreenBasicsTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(60),color: Colors.red),
            ),
            Text(
              character.artistWeight,
              style: KdetailScreenBasicsValueTextStyle.copyWith(
                fontSize: ScreenUtil.instance.setSp(52),
                color: character.artistPredominantColor
              ),
            ),
            Text(
              'Genre',
              style: KdetailScreenBasicsTextStyle.copyWith(
                  fontSize: ScreenUtil.instance.setSp(60),color: Colors.red),
            ),
            Text(
              character.artistMusicGenre,
              style: KdetailScreenBasicsValueTextStyle.copyWith(
                fontSize: ScreenUtil.instance.setSp(52),
                color: character.artistPredominantColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
