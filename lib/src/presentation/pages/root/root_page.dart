import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/material.dart';
import 'package:occam/occam.dart';

import 'root_controller.dart';

@FFRoute(name: '/')
class RootPage extends StateWidget<RootController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  RootController createState() => RootController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxWidget(
        notifier: state.currentIndex,
        builder: (context, value) => IndexedStack(
          index: value,
          children: state.list,
        ),
      ),
      bottomNavigationBar: RxWidget(
        notifier: state.currentIndex,
        builder: (ctx, index) => BottomNavigationBar(
          currentIndex: index,
          onTap: state.onTap,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              tooltip: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              tooltip: 'Explore',
              icon: Icon(
                Icons.explore,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              tooltip: 'Favorites',
              icon: Icon(
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              tooltip: 'Profile',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
