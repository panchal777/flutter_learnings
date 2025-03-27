import 'package:dartz/dartz.dart';
import 'package:flutter_learnings/core/network/error/failures.dart';
import 'package:flutter_learnings/domain/repository/sample_repository.dart';

class SampleRepositoryImpl extends SampleRepository {
  @override
  Stream<Either<Failure, int>> getStreamData() async*{

    try {
      final result = await articleRemote.getArticlesFromServer(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }


  }
}
