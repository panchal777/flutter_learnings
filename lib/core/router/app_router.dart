import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static String currentRoute = "/";

  static _bindRoute(dynamic settings, dynamic builderRoute) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (_) => builderRoute,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case "/":
        return _bindRoute(
          settings,
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );

      // case RouteName.articlesPage:
      //   return _bindRoute(
      //     settings,
      //     BlocProvider(
      //       create:
      //           (context) =>
      //               MainInjector.instance<ArticlesBloc>()
      //                 ..add(GetArticlesEvent('', 1)),
      //       child: ArticlesPage(),
      //     ),
      //   );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
