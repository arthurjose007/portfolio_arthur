import 'package:flutter/material.dart';
import 'components/MyProjectsNew.dart';
import 'components/homebannernew.dart';
import 'components/mainscreen.dart';
import 'components/recommendationsNew.dart';
import '../main/main_screen.dart';
import 'components/hightLightsInfoNew.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _myProjectsKey = GlobalKey();

  void _scrollToProjects() {
    // Smooth scroll
    Scrollable.ensureVisible(
      _myProjectsKey.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/g1.png'),
        ),
      ),
      child: MainScreen(
        controller: _scrollController,
        children: [
          HomeScreenNew(onExplorePressed: _scrollToProjects),
          // HightLightsInfoNew(),
          MyprojectsNew(key: _myProjectsKey),
          RecommendationsNew(),
        ],
      ),
    );
  }
}
