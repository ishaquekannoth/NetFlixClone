import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/search/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/9pCoqX24a6rE981fY1O3PmhiwrB.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle( title:'Top Searches' ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index)=>const TopItemSearchTile(),
              separatorBuilder: (context, index) => kheight20,
              itemCount: 10),
        )
      ],
    ));
  }
}


class TopItemSearchTile extends StatelessWidget {
  const TopItemSearchTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (Row(
      children: [
        Container(
          width: screenWidth*0.3,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        const Expanded(child: Text('Movie Name',style: TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 16),)),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 27,
          child:CircleAvatar(
                backgroundColor: kBlackcolor,
          radius: 25,
          child:Center(
            child: Icon(CupertinoIcons.play_fill,
            color: kWhiteColor,
            ),
          ) ,

          ),
        )
      ],
    ));
  }
}
