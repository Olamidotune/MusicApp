import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/models/playlist_model.dart';
import 'package:musicapp/models/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../config/colors.dart';
import '../widgets/seekbar.dart';

class SongScreen extends StatefulWidget {
  static const String routeName = 'SongScreen';
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Playlist playlist = Playlist.playlist[0];
  Song song = Song.songs[0];

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(
        Uri.parse(song.url),
      ),
    ]));
  }

  @override
  dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(position, duration ?? Duration.zero);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            song.coverUrl,
            fit: BoxFit.fill,
          ),
          const _BackgroundFliter(),
          _MusicPlayer(
              seekBarDataStream: _seekBarDataStream, audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        children: [
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: audioPlayer.seek,
              );
            },
          ),
          PlayerButton(audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
             if (snapshot.hasData) {

              final playerState = snapshot.data;
              final processingState =
                  (playerState! as PlayerState).processingState;

                if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.loading) {
                return Container(
                  height: 64,
                  width: 64,
                  margin: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                );
              }   //if audioPlayer is not player
            else if (!audioPlayer.playing) {
              return IconButton(
                onPressed: audioPlayer.play,
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ),
                iconSize: 75,
              );
            }    
          else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                icon: const Icon(
                  Icons.pause_circle,
                  color: Colors.white,
                ),
                iconSize: 75,
              );
            }       
        else {
              return IconButton(
                onPressed: () => audioPlayer.seek(Duration.zero,
                    index: audioPlayer.effectiveIndices!.first),
                icon: const Icon(
                  Icons.replay_circle_filled,
                  color: Colors.white,
                ),
                iconSize: 75,
              );
            }
             } else {
              return const CircularProgressIndicator();
            }
          }),
        
      ],
    );
  }
}

class _BackgroundFliter extends StatelessWidget {
  const _BackgroundFliter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0)
            ],
            stops: const [
              0.0,
              0.4,
              0.6,
            ]).createShader(rect);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              themeColor,
            ],
          ),
        ),
      ),
    );
  }
}





