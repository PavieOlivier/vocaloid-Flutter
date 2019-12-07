import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vocaloid/Const.dart';
import 'package:vocaloid/Model/Artist.dart';
import 'package:vocaloid/Screen/DetailScreen/DetailScreen.dart';

class ArtistCard extends StatelessWidget {
  final Artist artist;
  const ArtistCard({
    Key key, this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: DetailScreen(artist: artist,)));
        },
        child: Card(
          elevation: 0.6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        child:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(artist.artistImagePath),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: artist.artistPredominantColor.withOpacity(0.13))
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30,right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(artist.artistName,style: KArtistCardTextStyle.copyWith(
                  fontSize: ScreenUtil(allowFontScaling: true).setSp(85),
                  color: artist.artistPredominantColor
                ),),
              ),
            ),
          ),
        
      ),
    );
  }
}