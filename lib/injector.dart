import 'package:flutter_learnings/data/data_sources/local_src.dart';
import 'package:flutter_learnings/data/data_sources/local_src_impl.dart';
import 'package:flutter_learnings/data/repositories/sample_repository_impl.dart';
import 'package:flutter_learnings/domain/repository/sample_repository.dart';
import 'package:flutter_learnings/domain/usecases/get_data_stream_case.dart';
import 'package:flutter_learnings/presentation/bloc/sample_bloc.dart';
import 'package:get_it/get_it.dart' show GetIt;

class MainInjector {
  MainInjector._();

  static GetIt instance = GetIt.instance;

  static init() async {
    //define all injectors
    await FeatureInjector.init();
    await MainInjector.instance.allReady();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}

class FeatureInjector {
  FeatureInjector._();

  static init() async {
    final injector = MainInjector.instance;

    /// define all bloc
    injector.registerFactory(() => SampleBloc(getDataStreamCase: injector()));

    /// define all use case
    injector.registerLazySingleton(() => GetDataStreamCase(injector()));

    /// define all repos
    injector.registerLazySingleton<SampleRepository>(
      () => SampleRepositoryImpl(injector()),
    );

    /// define all local
    injector.registerLazySingleton<LocalSrc>(() => LocalSrcImpl());
  }
}
