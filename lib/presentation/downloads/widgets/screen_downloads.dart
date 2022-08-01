import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixproject/application/downloads/downloads_bloc.dart';
import 'package:netflixproject/core/colors/colors.dart';
import 'package:netflixproject/core/constants.dart';
import 'package:netflixproject/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidgets(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        itemBuilder: ((context, index) => _widgetList[index]),
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
      ),
    ));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  // final List imageList = [
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg",
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/x1q3FkqFHBkMeKnHiS6GYgdLvUs.jpg",
  //   "https://www.themoviedb.org/t/p/w220_and_h330_face/2ahZgaFAbWoKMfJHhmhZDrdStgD.jpg"
  // ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    final Size size = MediaQuery.of(context).size;

    return (Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kheight,
        const Text(
          'We will download a personalised selection of\nmovies and shows for you.So there is always\nSomething to watch on your\ndevice',
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                            radius: size.width * .36,
                            backgroundColor: Colors.grey.withOpacity(0.4)),
                        DownloadsImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads?[0].posterPath}',
                          margin: const EdgeInsets.only(
                              right: 130, bottom: 40, top: 50),
                          size: Size(size.width * 0.4, size.height * 0.4),
                          angle: -20,
                        ),
                        DownloadsImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads?[1].posterPath}',
                          margin: const EdgeInsets.only(
                              left: 130, bottom: 40, top: 50),
                          size: Size(size.width * 0.4, size.height * 0.4),
                          angle: 20,
                        ),
                        DownloadsImageWidget(
                          image:
                              '$imageAppendUrl${state.downloads?[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 20, top: 50),
                          size: Size(size.width * 0.4, size.height * 0.4),
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    ));
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            color: kButtonColorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
          color: kButtonColorWhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What you can download',
              style: TextStyle(
                  color: kBlackcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        )
      ],
    ));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text('Smart Download'),
        kwidth
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      this.angle = 0,
      required this.image,
      required this.margin,
      required this.size,
      this.borderRadius = 10})
      : super(key: key);

  final double angle;
  final String image;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            margin: margin,
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
