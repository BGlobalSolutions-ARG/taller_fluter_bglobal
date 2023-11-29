import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';
import 'src/domain/domains.dart';
import 'src/presentation/widgets/widgets.dart';
import 'src/version.dart';

void main() async {
  // usePathUrlStrategy();
  AppConfig.init(
    isDebug: true,
    urlApp: 'https://dummyjson.com',
    version: packageVersion,
  );

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );

  ErrorWidget.builder = RootWidget.onError;

  SystemChrome.setPreferredOrientations(
    const [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );

  ResultError.onError = (va) => log.d('${va.error} ${va.stackTrace()}');
  await Dependencies.init(
    hive: Hive,
  );


  runApp(const App());
}
