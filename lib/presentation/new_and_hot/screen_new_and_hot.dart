import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/new_and_hot/coming_soon_widget.dart';
import "package:netflixproject/presentation/new_and_hot/everyone's_watching_widget.dart";

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(82),
              child: AppBar(
                title: const Text(
                  "New and Hot",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),
                actions: [
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
                bottom: TabBar(
                  tabs: const [
                    Tab(
                      text: 'Coming Soon',
                    ),
                    Tab(text: "Everyone's watching "),
                  ],
                  labelColor: kBlackcolor,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                ),
              )),
          body: TabBarView(
              children: [_buildComingSoon(), _buildEveryonsWatching()]),
        ));
  }

  _buildComingSoon() {
    return (ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return const ComingSoonWidget();
        }));
  }
}

_buildEveryonsWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: ((context, index) => const EveryonesWatchingWidget()),
  );
}
