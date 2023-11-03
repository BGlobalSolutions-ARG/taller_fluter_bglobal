import 'package:occam/occam.dart';

import '../../../domain/domains.dart';

class ProductController extends StateController {
  @override
  void readyState() {
    init();
    super.readyState();
  }

  void init() {
    log.d(navArgs);
  }
}
