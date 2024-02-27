import 'package:flutter/material.dart';
import 'package:musicapp/components/my_drawer.dart';
import 'package:musicapp/models/playlist_provider.dart';
import 'package:musicapp/models/song.dart';
import 'package:musicapp/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void gotoSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("P L A Y L I S T"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongPage(),
                ),
              );
            },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
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
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.greenAccent,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          return Expanded(
            child: ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final Song song = playlist[index];

                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.albumArtImagePath),
                  onTap: () => gotoSong(index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
