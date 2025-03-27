import 'package:get_it/get_it.dart' show GetIt;

class MainInjector {
  MainInjector._();

  static GetIt instance = GetIt.instance;

  static init() async {
    //define all injectors

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
    // injector.registerFactory(() => ArticlesBloc(articlesUseCase: injector()));

    /// define all use case
    //  injector.registerLazySingleton(() => ArticlesUseCase(injector()));

    /// define all repos
    // injector.registerLazySingleton<ArticleRepository>(
    //   () => ArticleRepositoryImpl(injector()),
    // );


    /// define all local
    // injector.registerLazySingleton<ArticleRemote>(
    //       () => ArticleRemoteImpl(DioNetwork.appAPI),
    // );
  }
}
