import 'package:flutter_learnings/domain/repository/sample_repository.dart';
import '../data_sources/local_src.dart';

class SampleRepositoryImpl extends SampleRepository {
  LocalSrc localSrc;

  SampleRepositoryImpl(this.localSrc);

  @override
  Stream<int> getStreamData(int maxCount) async* {
    yield* localSrc.getStreamData(maxCount);

    // try {
    //   final result = await localSrc.getStreamData();
    //   yield Right(result.results ?? []);
    // } on ServerException catch (e) {
    //   yield Left(ServerFailure(e.message.toString(), e.statusCode));
    // } on CancelTokenException catch (e) {
    //   yield Left(GeneralFailure(e.message.toString(), e.statusCode));
    // }
  }
}
