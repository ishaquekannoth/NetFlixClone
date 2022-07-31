import 'package:flutter/material.dart';
import 'package:netflixproject/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/hangTmbxpSV4gpHG7MgSlCWSSFa.jpg"))),
    );
  }
}