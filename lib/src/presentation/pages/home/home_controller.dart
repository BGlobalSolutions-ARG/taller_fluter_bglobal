import 'package:bglobal/src/domain/product/product_domain.dart';
import 'package:bglobal/src/repository/repository.dart';
import 'package:bglobal/src/routes/bglobal_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:occam/occam.dart';

class HomeController extends StateController {
  final categories = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  final categorySelected = 0.rx;
  final isLoading = true.rx;
  final domain = getIt.get<ProductDomain>();
  final list = <Product>[].rx;

  void onCategorySelected(int index) {
    if (index != categorySelected()) categorySelected.value = index;
  }

  @override
  void readyState() {
    init();
    super.readyState();
  }

  void init() async {
    final result = await domain.getList();
    if (result.isError()) {
      context.showError(result.toString());
      return;
    }
    list.value = result.getValue();
    isLoading.value = false;
  }

  void getProducts() {
    navigator.pushNamed(RouteName.form);
  }

  void onTap(Product item) {
    Navigator.of(context).pushNamed(
      RouteName.product,
      arguments: {'data': item},
    );
  }

  void onChanged(String value) {
  }
}
