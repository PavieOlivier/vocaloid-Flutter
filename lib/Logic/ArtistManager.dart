import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vocaloid/Model/Album.dart';
import 'package:vocaloid/Model/Artist.dart';


class ArtistManager 
{
  ArtistManager({this.artist});
  List<Artist> artist;
  ///Use this to initiate the list of artists 
  ///Note: I am doing all this manually since it is only for mockup purpose
  Future <List> iniArtist () async
  {
    artist.add(new Artist(
      artistName: 'Hatsune\nMiku',
      artistAge: '16',
      artistHeight: '158 cm / 5 ft 2 in',
      artistImagePath: 'assets/images/characters/miku.png',
      artistWeight: '42 kg / 93 lb',
      artistMusicGenre: 'Pop, rock, dance, house, techno, crossover',
      artistPredominantColor: Colors.blueGrey
    ));

    artist.add(new Artist(
      artistName: 'Megu',
      artistAge: '20',
      artistHeight: '162 cm / 5 ft 3 in',
      artistImagePath: 'assets/images/characters/ml.png',
      artistWeight: '45 kg / 99 lb',
      artistMusicGenre: 'Pop, rock, dance, house, techno, crossover',
      artistPredominantColor: Color(0xff2B1117)
    ));
    return artist;
  }

  Future <bool> getAlbum() async
  {
    //for hatsune, data are fake but it is ok
    artist[0].albums = [];
    artist[0].albums.add(new Album(albumTitle: 'Magical Mirai', albumImagePath: 'assets/images/albums/mk1.jpeg'));
    artist[0].albums.add(new Album(albumTitle: 'Red Flower', albumImagePath: 'assets/images/albums/mk2.jpeg'));
    artist[0].albums.add(new Album(albumTitle: '2014 In Ozaka', albumImagePath: 'assets/images/albums/mk3.jpeg'));
    artist[0].albums.add(new Album(albumTitle: 'Mirai Magic CC', albumImagePath: 'assets/images/albums/mk4.jpeg'));
    //for megurine
    artist[1].albums = [];
    artist[1].albums.add(new Album(albumTitle: 'Megurine Motion', albumImagePath: 'assets/images/albums/ml1.jpeg'));
    artist[1].albums.add(new Album(albumTitle: 'Asymetric SPE', albumImagePath: 'assets/images/albums/ml2.png'));
    artist[1].albums.add(new Album(albumTitle: 'Forbidden Happiness', albumImagePath: 'assets/images/albums/ml3.png'));
    return true;
  }

}