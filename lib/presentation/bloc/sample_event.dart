abstract class SampleEvent {
  const SampleEvent();
}

class StartStreamingEvent extends SampleEvent {
  int maxCounts;

  StartStreamingEvent(this.maxCounts);
}

class StopStreamingEvent extends SampleEvent {}
