import 'dart:math';

// Define the Song class
class Song {
  //using set and getters for title and duration of songs
  String title;
  int duration;

  //constructor
  Song(this.title, this.duration);

  //this method is for calculate the duration of music
  String getFormattedDuration() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return '${minutes}m ${seconds}s';
  }

  //this method is for printing the details of songs
  void printDetails() {
    print('Title: $title, Duration: ${getFormattedDuration()}');
  }
}


class Playlist {
  
  //this list is to store songs in the playlist
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  //this method is for adding song in the list playlist
  void addSong(Song song) {
    songs.add(song);
  }

  //this method is calculate duration of playlist
  int getTotalDuration() {
    int totalDuration = 0;
    for (Song song in songs) {
      totalDuration += song.duration;
    }
    return totalDuration;
  }

  void printDetails() {
    print('Playlist: $name');
    for (Song song in songs) {
      song.printDetails();
    }
  }

  // Helper method to get the total duration in a readable format
  String getFormattedTotalDuration() {
    int totalDuration = getTotalDuration();
    int minutes = totalDuration ~/ 60; 
    int seconds = totalDuration % 60;
    return '${minutes}m ${seconds}s';
  }
}

// Define the MusicFestival class
class MusicFestival {
  //this list is store playlist in the list
  String name;
  List<Playlist> playlists = [];

  MusicFestival(this.name);

  void addPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

  //calculation of duration time of music
  int getTotalDuration() {
    int totalDuration = 0;
    for (Playlist playlist in playlists) {
      totalDuration += playlist.getTotalDuration();
    }
    return totalDuration;
  }

  // Method to print festival details
  void printDetails() {
    print('Music Festival: $name');
    for (Playlist playlist in playlists) {
      playlist.printDetails();
      print('-------------------------------------------------------------');
    }
  }

  // Helper method to get the total duration in a readable format
  String getFormattedTotalDuration() {
    int totalDuration = getTotalDuration();
    int minutes = totalDuration ~/ 60; // Integer division to get minutes
    int seconds = totalDuration % 60; // Modulus to get remaining seconds
    return '${minutes}m ${seconds}s';
  }
}

void main() {
  // Create a music festival
  MusicFestival festival = MusicFestival('LOVE. POP, EMOTION MUSIC');
  // Create playlist 1,2,3
  Playlist list1 = Playlist(' Love Song');
  Playlist list2 = Playlist('Pop Song');
  Playlist list3 = Playlist('Emotional Song');

  //this is to add songs in the playlist --LOVE SONG
  list1.addSong(Song('Wildflower by Billie Eilish', 262));
  list1.addSong(Song('duvet by boa', 235));
  list1.addSong(Song('Here With Me by d4vd', 200));
  list1.addSong(Song('those eyes by New West', 150));
  list1.addSong(Song('Sleepwell d4vd', 220));

  //this is to add songs in the playlist --POP SONGS
  list2.addSong(Song('Guilty as sin by Taylor Swift', 210));
  list2.addSong(Song('Nobody Gets Me by Sza', 180));
  list2.addSong(Song('Enough For You by olivia Rodrigo', 250));
  list2.addSong(Song('Sunsets By Cigarretes after sex', 180));
  list2.addSong(Song('beautiful things by benson boone', 210));

  //this is to add songs in the playlist --EMOTIONAL SONGS
  list3.addSong(Song('August by taylor swift', 250));
  list3.addSong(Song('romantic homicide by d4vd', 270));
  list3.addSong(Song('Look After You by the fray', 245));
  list3.addSong(Song('cardigan by taylor swift', 245));
  list3.addSong(Song('happier than ever by billie eilish', 230));

  festival.addPlaylist(list1);
  festival.addPlaylist(list2);
  festival.addPlaylist(list3);

  festival.printDetails();

  print(
      'Total Duration of Festival Music is: ${festival.getFormattedTotalDuration()}');
}
