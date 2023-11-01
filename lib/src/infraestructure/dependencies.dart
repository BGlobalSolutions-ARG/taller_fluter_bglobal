import 'package:bglobal/src/domain/product/product_domain.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import '../domain/domains.dart';

final getIt = GetIt.instance;
final log = Logger();
mixin Dependencies {
  static Future<void> init({
    required HiveInterface hive,
    // required FirebaseApp fire,
  }) async {
    // final auth = FirebaseAuth.instanceFor(app: fire);
    // final googleSignIn = GoogleSignIn(scopes: AuthRepositoryImpl.scopes);
    // final authRepository = AuthRepositoryImpl(googleSignIn, hive);
    getIt.registerFactory<ProductDomain>(
      () => ProductDomainImpl(ProductRepositoryImpl(hive)),
    );

    // getIt.registerFactory<JobDomain>(
    //   () => JobDomainImpl(JobRepositoryImpl(hive)),
    // );
    // getIt.registerFactory<UserDomain>(
    //   () => UserDomainImpl(UserRepositoryImpl(hive, authRepository)),
    // );

    await handleHive(hive);
    // await Future.wait([
    //   getIt.get<RideDomain>().repository.init(),
    // ]);
    return;
  }

  static Future<void> handleHive(HiveInterface interface) async {
    await interface.initFlutter();

    await interface.openBox('favorites');
    Future<void> open() async {
      try {
        await interface.openBox('settings');
      } on Exception {
        await interface.deleteBoxFromDisk('settings');
        return await open();

        // ignore: avoid_catching_errors
      } on HiveError {
        await interface.deleteBoxFromDisk('settings');
        return await open();
      } catch (e) {
        await interface.deleteBoxFromDisk('settings');
        await open();
      }
      return;
    }

    await open();
    getIt.registerSingleton<ApiRepository>(ApiRepository());

    return;
  }
}
