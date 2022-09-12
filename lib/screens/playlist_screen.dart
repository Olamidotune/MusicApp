import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/models/playlist_model.dart';
import 'package:musicapp/models/song_model.dart';
import 'package:sizer/sizer.dart';

import '../config/colors.dart';

class PlaylistScreen extends StatelessWidget {
  static const String routeName = 'PlaylistScreen';

  const PlaylistScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist playlist = Playlist.playlist[0];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            themeColor.withOpacity(0.8),
            Colors.deepPurple.shade100.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed:() => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Playlists'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _PlaylistInfo(playlist: playlist),
                const SizedBox(
                  height: 30,
                ),
                const _PlayShuffleSwitch(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlist.songs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        '${index + 1}',
                      ),
                      title: Text(
                        playlist.songs[index].title,
                        style: GoogleFonts.mulish(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 17),
                        ),
                      ),
                      subtitle: Text(
                        playlist.songs[index].description,
                        style: GoogleFonts.mulish(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 17),
                        ),
                      ),
                      trailing: const Icon(Icons.more_vert, color: Colors.white,),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayShuffleSwitch extends StatefulWidget {
  const _PlayShuffleSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<_PlayShuffleSwitch> createState() => _PlayShuffleSwitchState();
}

class _PlayShuffleSwitchState extends State<_PlayShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          //isPlay is oppsite of current value.
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isPlay ? 0 : width * 0.45,
            child: Container(
              height: 50,
              width: width * 0.45,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Play',
                        style: GoogleFonts.mulish(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color:
                                      isPlay ? Colors.white : Colors.deepPurple,
                                  fontSize: 17),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white : Colors.purple,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Shuffle',
                        style: GoogleFonts.mulish(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color:
                                      isPlay ? Colors.deepPurple : Colors.white,
                                  fontSize: 17),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.shuffle,
                      color: isPlay ? Colors.deepPurple : Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class _PlaylistInfo extends StatelessWidget {
  const _PlaylistInfo({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            playlist.coverUrl,
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.height * 0.30,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          playlist.name,
          style: GoogleFonts.mulish(
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
