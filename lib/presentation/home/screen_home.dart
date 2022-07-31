import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/home/background_card.dart';
import 'package:netflixproject/presentation/home/number_title_card.dart';
import 'package:netflixproject/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return (NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }

            return true;
          }),
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTitleCard(
                    title: 'Released in the past year',
                  ),
                  kheight,
                  MainTitleCard(title: 'Trending Now'),
                  kheight,
                  NumberTitleCard(),
                  kheight,
                  MainTitleCard(title: 'Tense Dramas'),
                  kheight,
                  MainTitleCard(title: 'South Indian Cinemas'),
                  kheight,
                ],
              ),
              scrollNotifier.value == true
                  ?AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 80,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png",
                                width: 60,
                                height: 60,
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: (const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 30,
                                  ))),
                                  kwidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TV show',style: kHomeTileText,),
                              Text('Movies',style: kHomeTileText,),
                              Text('Categories',style: kHomeTileText,),
                            ],

                          )
                        ],
                      ),
                    )
                  : kheight
            ],
          ),
        ));
      },
    )));
  }
}
