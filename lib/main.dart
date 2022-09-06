import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/config/colors.dart';
import 'package:musicapp/screens/home_screen.dart';
import 'package:musicapp/screens/playlist_screen.dart';
import 'package:musicapp/screens/song_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomeScreen(),
        theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: textColor, displayColor: textColor),
        ),
        getPages: [
          GetPage(
            name: '/HomeScreen',
            page: (() => const HomeScreen()),
          ),
          GetPage(
            name: '/SongScreen',
            page: (() => const SongScreen()),
          ),
          GetPage(
            name: '/PlaylistScreen',
            page: (() => const PlaylistScreen()),
          ),
        ],
      ),
    );
  }
}
