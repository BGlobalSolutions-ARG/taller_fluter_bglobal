import 'package:flutter/material.dart';
import 'package:occam/occam.dart';

import 'explore_controller.dart';

class ExplorePage extends StateWidget<ExploreController> {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExploreController createState() => ExploreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Container(),
    );
  }
}
