import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/widgets.dart';

import 'bglobal_route.dart';

mixin RouteMiddleware {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route generateRoute(RouteSettings settings) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    return onGenerateRoute(
      settings: settings,
      getRouteSettings: getRouteSettings,
    );
  }
}
