import 'package:d_to_d/widgets/home/home_body.dart';
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
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainPage(
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => NoTransitionPage(
              child: HomeBody(),
            ),
          ),
          GoRoute(
            path: '/setting',
            pageBuilder: (context, state) => NoTransitionPage(
              child: SettingPage(),
            ),
          )
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => Login(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
