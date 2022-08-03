import 'package:flutter/material.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/home/custom_button_widget.dart';
import 'package:netflixproject/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key, required this.id, required this.month, required this.day, required this.posterPath, required this.movieName, required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(month,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
            width: size.width - 50,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              VideoWidget(url: posterPath),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(
                       child: Text(
                        movieName,
                        style: const TextStyle(
                          overflow: TextOverflow.clip,
                            letterSpacing: -3,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                            maxLines: 1,
                                         ),
                     ),
                  
                    const CustomButtonWidget(
                      icon: Icons.all_out_sharp,
                      title: 'Remind Me',
                      iconSize: 20,
                      textSize: 16,
                    ),
                    kwidth,
                    const CustomButtonWidget(
                      icon: Icons.info,
                      title: 'Info',
                      iconSize: 20,
                      textSize: 16,
                    ),
                    kwidth
                  ],
                ),
                kheight,
                 Text('Coming on $day $month'),
                kheight,
                 Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight,
                 Text(
                  description,
                  maxLines: 4,

                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )),
      ],
    );
  }
}
