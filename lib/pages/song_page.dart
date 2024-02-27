import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/components/nue_box.dart';
import 'package:musicapp/favoritesong/favorite.dart';
import 'package:musicapp/models/playlist_provider.dart';
import 'package:musicapp/pages/settings_page.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String fromatTime(Duration duration) {
    String twoDigiSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String fromattedTime = "${duration.inMinutes}:$twoDigiSeconds";

    return fromattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playlist;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),

                      //title
                      const Text("P L A Y L I S T"),

                      //menu button
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ),
                          );
                        },
                        icon: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade800,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.dark_mode,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),

                  //album artwork
                  NueBox(
                    child: Column(
                      children: [
                        //images
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentSong.albumArtImagePath),
                        ),

                        //song and artist name and icon
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(currentSong.artistName)
                                ],
                              ),
                              //heart icon
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FavoriteSong(),
                                    ),
                                  );
                                },
                                icon: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.red.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0, 2.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //song duration progress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //start time
                            Text(fromatTime(value.currentDuration)),

                            //shuffle icon
                            const Icon(Icons.shuffle),

                            //repeat icon
                            const Icon(Icons.repeat),

                            //end time
                            Text(fromatTime(value.totalDuration)),
                          ],
                        ),
                      ),

                      //song duration progress
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0),
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          activeColor: Colors.red,
                          onChanged: (double double) {
                            //
                          },
                          onChangeEnd: (double double) {
                            //
                            value.seek(Duration(seconds: double.toInt()));
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //playback contriols
                  Row(
                    children: [
                      //skip previous
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: NueBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),
                      //play pause
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NueBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      //
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNextSong,
                          child: const NueBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
