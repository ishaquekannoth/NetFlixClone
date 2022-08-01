import 'package:flutter/cupertino.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/search/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.5,
            children: List.generate(10, (index) {
              return const MainCard();
            }),
          ),
        )
      ],
    ));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    ));
  }
}
