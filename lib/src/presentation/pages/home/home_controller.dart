import 'package:occam/occam.dart';

class HomeController extends StateController {
  final categorySelected = 0.rx;

  void onCategorySelected(int index) => categorySelected.value = index;
}
