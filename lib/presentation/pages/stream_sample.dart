import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learnings/presentation/bloc/sample_bloc.dart';
import 'package:flutter_learnings/presentation/bloc/sample_state.dart';

import '../bloc/sample_event.dart';

class StreamSample extends StatelessWidget {
  const StreamSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Data")),
      body: BlocBuilder<SampleBloc, SampleState>(
        builder: (context, state) {
          var value = '0';

          if (state is FetchedDataState) {
            value = state.value.toString();
          } else if (state is ErrorState) {
            value = state.errorMsg;
          }

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'play',
            onPressed:
                () => context.read<SampleBloc>().add(StartStreamingEvent(20)),
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'stop',
            onPressed:
                () => context.read<SampleBloc>().add(StopStreamingEvent()),
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}
