import 'package:bglobal/src/routes/bglobal_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'domain/domains.dart';
import 'presentation/widgets/widgets.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.nextFocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BGlobal',
        theme: AppTheme.theme,
        supportedLocales: const [
          Locale('es', 'AR'),
          Locale('es', 'ES'),
          Locale('es', 'PY'),
        ],
        initialRoute: RouteName.root,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: RouteMiddleware.generateRoute,
        scaffoldMessengerKey: DialogHelper.key,
        restorationScopeId: 'app',
      ),
    );
  }
}
