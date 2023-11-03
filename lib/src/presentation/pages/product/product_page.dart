import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/material.dart';
import 'package:occam/occam.dart';

import 'product_controller.dart';

@FFRoute(name: '/product')
class ProductPage extends StateWidget<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  ProductController createState() => ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Container(),
    );
  }
}
