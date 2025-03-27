import 'package:dartz/dartz.dart';
import 'package:flutter_learnings/core/network/error/failures.dart';

abstract class SampleRepository {
  Stream<Either<Failure, int>> getStreamData();
}
