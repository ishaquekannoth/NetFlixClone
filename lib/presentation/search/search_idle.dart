import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/search/search_bloc.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/search/title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(child: Text('Err fetching Data'));
            } else if (state.idleList.isEmpty) {
              return const Center(child: Text('List is Empty'));
            }
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return (TopItemSearchTile(
                        title: movie.title ?? 'No title provided',
                        imageUrl: '$imageAppendUrl${movie.posterPath}'));
                  },
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: state.idleList.length),
            );
          },
        )
      ],
    ));
  }
}

class TopItemSearchTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopItemSearchTile(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 27,
          child: CircleAvatar(
            backgroundColor: kBlackcolor,
            radius: 25,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
