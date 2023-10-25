import 'package:bglobal/src/presentation/pages/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'domain/domains.dart';
import 'presentation/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BGlobal',
      theme: AppTheme.theme,
      supportedLocales: const [
        Locale('es', 'AR'),
        Locale('es', 'ES'),
        Locale('es', 'PY'),
      ],
      initialRoute: '/',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {'/': (context) => const HomePage()},
      scaffoldMessengerKey: DialogHelper.key,
      restorationScopeId: 'app',
    );
  }
}
