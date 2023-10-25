import 'package:hive/hive.dart';

import 'hive_repository.dart';

mixin HiveSettings {
  static final _repository = HiveRepository(Hive);

  static T get<T>(String key) => _repository.get('settings', key) as T;

  static Future<void> put(String key, dynamic data) async =>
      await _repository.put('settings', key, data);

  static void delete(String key) => _repository.delete('settings', key);

  static Future<void> clear() => _repository.clear('settings');
  
}
