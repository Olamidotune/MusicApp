import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:musicapp/models/playlist_model.dart';
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
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Playlists'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_sharp,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 30.h,
                width: 60.w,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    playlist.coverUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
