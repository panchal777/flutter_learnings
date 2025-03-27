import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learnings/presentation/bloc/sample_event.dart';
import 'package:flutter_learnings/presentation/bloc/sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(InitialState());
}
