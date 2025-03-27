import 'package:dartz/dartz.dart';
import 'package:flutter_learnings/core/network/error/failures.dart';
import 'package:flutter_learnings/core/utils/use_case.dart';

class GetDataStreamCase extends StreamUseCase<int, NoParams> {
  @override
  Stream<Either<Failure, int>> call(NoParams params) {}
}
