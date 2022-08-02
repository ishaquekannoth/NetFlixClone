import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    return Stack(
      children: [
        (Container(
          color: Colors.accents[index % Colors.accents.length],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: kWhiteColor,
                        ))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    VideoActionWidget(
                        icon: Icons.emoji_emotions, titile: 'Lol'),
                    VideoActionWidget(icon: Icons.add, titile: 'My List'),
                    VideoActionWidget(icon: Icons.share, titile: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, titile: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({Key? key, required this.icon, required this.titile})
      : super(key: key);
  final IconData icon;
  final String titile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: (Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            titile,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      )),
    );
  }
}
