import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learnings/domain/usecases/get_data_stream_case.dart';
import 'package:flutter_learnings/presentation/bloc/sample_event.dart';
import 'package:flutter_learnings/presentation/bloc/sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  GetDataStreamCase getDataStreamCase;

  StreamSubscription<int>? _counterSubscription;

  SampleBloc({required this.getDataStreamCase}) : super(InitialState()) {
    // on<StartStreamingEvent>(_startStreamWithFirstApproach); // first approach
    on<StartStreamingEvent>(_startStreamWithSecondApproach); // second approach
    on<StopStreamingEvent>(_stopStreaming);
  }

  //
  // FutureOr<void> _startStreamWithFirstApproach(
  //   StartStreamingEvent event,
  //   Emitter<SampleState> emit,
  // ) async {
  //   emit(StateLoading());
  //
  //   ///first approach to yield
  //   await emit.forEach(
  //     getDataStreamCase.call(event.maxCounts), // Your stream source
  //     onData: (data) => FetchedDataState(data), // Transform data into state
  //     onError: (error, stackTrace) => ErrorState(error.toString()),
  //   );
  // }

  FutureOr<void> _startStreamWithSecondApproach(
    StartStreamingEvent event,
    Emitter<SampleState> emit,
  ) async {
    emit(StateLoading());
    _counterSubscription?.cancel();
    // Create a Completer to keep the handler alive
    final completer = Completer<void>();
    _counterSubscription = getDataStreamCase
        .call(event.maxCounts)
        .listen(
          (value) {
            if (!completer.isCompleted) {
              emit(FetchedDataState(value)); // Emit data state
            }
          },
          onError: (error) {
            if (!completer.isCompleted) {
              emit(ErrorState(error.toString())); // Handle errors
            }
          },
          onDone: () {
            completer.complete(); // Mark as complete when stream ends
          },
        );

    return completer.future; // Keep the event handler active
  }

  FutureOr<void> _stopStreaming(
    StopStreamingEvent event,
    Emitter<SampleState> emit,
  ) async {
    _counterSubscription?.cancel();
    _counterSubscription = null;
    emit(InitialState()); // Emit an appropriate state when stopped
  }

  @override
  Future<void> close() {
    _counterSubscription?.cancel();
    _counterSubscription = null;
    return super.close();
  }
}
