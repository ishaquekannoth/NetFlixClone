import 'package:flutter/material.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/home/custom_button_widget.dart';
import 'package:netflixproject/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
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
            children: const [
              Text('FEB',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              Text(
                '11',
                style: TextStyle(
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
                const VideoWidget(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tall Girl",
                      style: TextStyle(
                          letterSpacing: -3,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        CustomButtonWidget(
                          icon: Icons.all_out_sharp,
                          title: 'Remind Me',
                          iconSize: 20,
                          textSize: 16,
                        ),
                        kwidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: 'Info',
                          iconSize: 20,
                          textSize: 16,
                        ),
                        kwidth,
                      ],
                    )
                  ],
                ),
                kheight,
                const Text('Coming on friday'),
                kheight,
                const Text(
                  "Tall Girl",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight,
                const Text(
                  'Landing the lead in the school in the musical is a dream come true for jodi,until the pressure sends her confidence-and her relationship-into a tailspain',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
      ],
    );
  }
}

