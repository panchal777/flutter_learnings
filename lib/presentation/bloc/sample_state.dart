abstract class SampleState {
  const SampleState();
}

class InitialState extends SampleState {}

class StateLoading extends SampleState {}

class ErrorState extends SampleState {
  String errorMsg;

  ErrorState(this.errorMsg);
}

/*---------------------------*/
class FetchedDataState extends SampleState {
  final int value;

  FetchedDataState(this.value);
}
