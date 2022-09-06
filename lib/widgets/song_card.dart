import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/config/colors.dart';
import 'package:sizer/sizer.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: () {
         Get.toNamed ('/SongScreen', arguments:song);
        },
        highlightColor: themeColor,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(song.coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              
              left: 5,
              right: 10,
              bottom: 10,
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.38,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.80),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              song.title,
                              style: GoogleFonts.mulish(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: themeText),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              song.description,
                              style: GoogleFonts.mulish(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 10.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Icon(Icons.play_circle),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
