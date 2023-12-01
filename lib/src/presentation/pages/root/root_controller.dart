import 'package:bglobal/src/presentation/pages/explore/explore_page.dart';
import 'package:bglobal/src/presentation/pages/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:occam/occam.dart';

class RootController extends StateController {
  final currentIndex = 0.rx;

  final list = [
    const HomePage(),
    const ExplorePage(),
    const Center(
      child: Text(
        'Favorite',
        style: TextStyle(fontWeight: FontWeight.w100,fontSize: 24),
      ),
    ),
    const Center(
      child: Text('Profile'),
    )
  ];

  void onTap(int value) {
    currentIndex.value = value;
  }
}
