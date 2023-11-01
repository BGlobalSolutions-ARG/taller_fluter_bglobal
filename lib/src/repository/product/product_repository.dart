import 'package:bglobal/src/repository/repository.dart';

abstract class ProductRepository extends Repository {
  ProductRepository(super.hiveInterface);
  Future<Result<List<Product>>> getList();
}

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl(super.hiveInterface);

  @override
  Future<Result<List<Product>>> getList() async {
    try {
      final result = await dio.get('/products');
      if (result.statusCode == 200) {
        return Success(ProductResponse.fromJson(result.data).products);
      }
      return Success([]);
    } catch (e, s) {
      return Failure(e, s);
    }
  }
}
