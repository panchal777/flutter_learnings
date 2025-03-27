import 'package:dartz/dartz.dart';

import '../network/error/failures.dart';

abstract class FutureUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

class NoParams {}
