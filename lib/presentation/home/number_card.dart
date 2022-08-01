import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/uSMJbYhaEpQtF9vkMhpgljc0CA4.jpg"))),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -30,
          child: BorderedText(
            strokeColor: kWhiteColor,
            strokeWidth: 4.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  color: kBlackcolor,
                  fontSize: 130,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
