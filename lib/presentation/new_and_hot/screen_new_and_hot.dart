import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/hot_and_new/hot_and_new_bloc.dart';
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
          body: TabBarView(children: [
            const ComingSoonList(
              key: Key('Coming Soon'),
            ),
            _buildEveryonsWatching()
          ]),
        ));
  }

  // _buildComingSoon() {
  //   return (ListView.builder(
  //       itemCount: 5,
  //       itemBuilder: (BuildContext context, index) {
  //         return const ComingSoonWidget();
  //       }));
  // }
}

_buildEveryonsWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: ((context, index) => SizedBox()),
  );
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return (const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ));
        }  
         else if (state.hasError) {
          return (const Center(
            child: Text("Err loading coming soon List"),
          ));
        }
        else if (state.comingSoonList.isEmpty) {
          return (const Center(
            child: Text("Coming soon List is empty"),
          ));
        }      
        else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return (const SizedBox());
                }
                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: 'Mar',
                    day: '11',
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No description');
              });
        }
      },
    );
  }
}
