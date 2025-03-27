import 'package:flutter_learnings/core/utils/use_case.dart';
import 'package:flutter_learnings/domain/repository/sample_repository.dart';

class GetDataStreamCase extends StreamUseCase<int, int> {
  SampleRepository _sampleRepository;

  GetDataStreamCase(this._sampleRepository);

  @override
  Stream<int> call(int params) async* {
    yield* _sampleRepository.getStreamData(params);
  }
}
