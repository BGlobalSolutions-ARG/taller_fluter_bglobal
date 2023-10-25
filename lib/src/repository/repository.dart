
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../domain/domains.dart';
import '../infraestructure/hive_repository.dart';

export 'package:tie_fp/tie_fp.dart';
export 'package:tie_fp_dio/tie_fp_dio.dart';

export '../domain/domains.dart';
export '../models/models.dart';

abstract class Repository<T> {
  final HiveInterface hiveInterface;

  Repository(this.hiveInterface);


  ApiRepository get repo => getIt.get<ApiRepository>();

  Dio get dio => repo.dio;

  HiveRepository get hive => HiveRepository(hiveInterface);

  // String userId() =>..auth.currentUser!.id;

  String get apiUrl => dio.options.baseUrl;

  Options noLog() => Options(
        extra: {
          'noLog': true,
        },
      );
}
