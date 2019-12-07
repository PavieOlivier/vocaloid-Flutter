import 'dart:ui';
import 'Album.dart';

class Artist {
  Artist(
      {this.artistAge,
      this.artistName,
      this.artistHeight,
      this.artistImagePath,
      this.artistMusicGenre,
      this.artistPredominantColor,
      this.artistWeight});
  String artistAge;
  String artistName;
  String artistHeight;
  String artistWeight;
  String artistImagePath;
  String artistMusicGenre;
  Color artistPredominantColor;
  List<Album> albums;
}
