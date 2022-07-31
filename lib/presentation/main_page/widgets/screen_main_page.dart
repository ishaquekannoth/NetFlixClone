import 'package:flutter/material.dart';
import 'package:netflixproject/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflixproject/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflixproject/presentation/home/screen_home.dart';
import 'package:netflixproject/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflixproject/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixproject/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final List pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
