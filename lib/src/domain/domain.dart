import 'package:dio/dio.dart';

export 'package:tie_fp/tie_fp.dart';

export '../infraestructure/infraestructures.dart';
export '../models/models.dart';
export '../repository/repositories.dart';
export '../utils/utils.dart';

abstract class Domain<T> {
  // void init();

  Options noLog() => Options(
        extra: {
          'noLog': true,
        },
      );
}
