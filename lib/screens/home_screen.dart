import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/config/colors.dart';

import '../models/playlist_model.dart';
import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';
import '../widgets/textformfield.dart';
import '../models/song_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlist;

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
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _BottomNavigationBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const _DiscoverMusic(),
                const SectionHeader(
                  title: 'Trending Music',
                  action: 'View More',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        return SongCard(song: songs[index]);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionHeader(
                  title: 'Playlists',
                  action: 'View More',
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemCount: playlists.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return PlaylistCard(
                      playlist: playlists[index],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController homescreentextformcontroller =
        TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: GoogleFonts.aladin(
                textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      height: 0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Enjoy Your Favorite Music',
              style: GoogleFonts.crimsonPro(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Textformfield(
              homescreentextformcontroller: homescreentextformcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.grid_view_rounded,
          // size: 40,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://bit.ly/3AKqmxi',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58.0);
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themeText.withOpacity(0.4),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      currentIndex: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Favourites',
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Playlists',
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_outline,
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.people_outline,
            ),
          ),
        ),
      ],
    );
  }
}
