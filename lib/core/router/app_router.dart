import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learnings/core/router/router_name.dart';
import 'package:flutter_learnings/presentation/bloc/sample_bloc.dart';
import 'package:flutter_learnings/presentation/pages/feature_page.dart';
import 'package:flutter_learnings/presentation/pages/stream_sample.dart';
import 'package:go_router/go_router.dart';

import '../../injector.dart';

class AppRouter {
  AppRouter._();

  /// Key so we can navigate without context.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /*----------------------------------------*/

  static GoRouter? _baseRoutes;

  static GoRouter get baseRouters => _baseRoutes!;

  static List<GoRoute> get routes => _routes;

  static void init() {
    _baseRoutes = GoRouter(
      navigatorKey: navigatorKey,
      //observers: routeObservers,
      routes: <GoRoute>[...routes],
      redirect: (context, state) {
        log('url => ${state.uri.toString()}');
        return null;
      },
    );
  }

  static final _routes = <GoRoute>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) {
        return FeaturePage();
      },
      routes: [
        //initialising local bloc
        GoRoute(
          name: RouteName.streamData,
          path: RouteName.streamData,
          builder:
              (context, state) => BlocProvider(
                create: (context) => MainInjector.instance<SampleBloc>(),
                child: StreamSample(),
              ),
        ),
      ],
    ),
  ];
}
