import '../repository.dart';

abstract class JobRepository extends Repository {
  JobRepository(super.hiveInterface);

  // Future<Result<List<Job>>> getJobs();
  // Future<Result<List<String>>> getDatasets();
  // Future<Result<Job>> getJob(String id);
  // Future<Result> jobRequest({
  //   required String tableName,
  //   required String dataset,
  // });
  // Future<Result<OdataResponse>> getTables();
}

class JobRepositoryImpl extends JobRepository {
  JobRepositoryImpl(super.hiveInterface);

  // @override
  // Future<Result<List<String>>> getDatasets() =>
  //     dio.get('/bigquery/datasets').toResultList<String>();

  // @override
  // Future<Result<Job>> getJob(String id) =>
  //     dio.get('/bigquery/jobs/$id').toResult(serializer: Job.fromJson);

  // @override
  // Future<Result<List<Job>>> getJobs() =>
  //     dio.get('/bigquery/jobs').toResultList(serializer: Job.fromJson);

  // @override
  // Future<Result> jobRequest({
  //   required String tableName,
  //   required String dataset,
  // }) =>
  //     dio.post(
  //       '/bigquery/migrate',
  //       data: {
  //         'table_name': tableName,
  //         'dataset': dataset,
  //       },
  //     ).toResult();

  // @override
  // Future<Result<OdataResponse>> getTables() => dio.get('/odata').toResult(
  //       serializer: OdataResponse.fromJson,
  //     );
}
