import 'package:flutter/material.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/home/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return(
      Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: NetworkImage(kMainImage))),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [const CustomButtonWidget(title: 'My List',icon: Icons.add,), _playButton(),
                    const CustomButtonWidget(icon: Icons.info, title: 'Info')
                    ],
                  ),
                ),
              )
            ],
          )
    );
    
  }


  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: kBlackcolor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kBlackcolor),
          ),
        ));
  }
}