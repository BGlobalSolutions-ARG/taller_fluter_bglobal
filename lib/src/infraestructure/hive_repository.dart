// ignore_for_file: avoid_print

import 'package:hive/hive.dart';

class HiveRepository {
  final HiveInterface interface;

  HiveRepository(this.interface);

  T? get<T>(String boxName, String key) {
    final box = interface.box<T>(boxName);
    final result = box.get(key);
    print('se obtuvo de $key la data $result');
    return result;
  }

  List<T> getList<T>(String boxName) {
    final box = interface.box<T>(boxName);
    return box.values.toList();
    
  }

  Future clear<T>(String boxName) {
    final box = interface.box<T>(boxName);
    return box.clear();
  }

  Future<void> put<T>(String boxName, String key, T data) async {
    if (data == null) return;
    // print('se inserto en $key la data $data ');
    final box = interface.box<T>(boxName);
    return await box.put(key, data);
  }

  void delete<T>(String boxName, String key) {
    final box = interface.box<T>(boxName);
    box.delete(key);
  }
}
