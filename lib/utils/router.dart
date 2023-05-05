import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:d_to_d/screens/setting/setting_page.dart';
import 'package:d_to_d/screens/main_page.dart';
import 'package:d_to_d/screens/login/login.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => MainPage(key: state.pageKey),
      ),
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) => ,),
      // )
      GoRoute(
        path: '/login',
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => SettingPage(key: state.pageKey),
      )
    ],
  );

  static GoRouter get router => _router;
}
