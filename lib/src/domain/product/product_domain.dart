import 'package:bglobal/src/repository/repository.dart';

abstract class ProductDomain extends Domain {
  final ProductRepository repo;

  ProductDomain(this.repo);
  Future<Result<List<Product>>> getList();
}

class ProductDomainImpl extends ProductDomain {
  ProductDomainImpl(super.repo);

  @override
  Future<Result<List<Product>>> getList() => repo.getList();
}
