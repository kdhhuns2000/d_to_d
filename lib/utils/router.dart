import 'package:d_to_d/widgets/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:d_to_d/screens/setting/setting_page.dart';
import 'package:d_to_d/screens/main_page.dart';
import 'package:d_to_d/screens/login/login.dart';
import 'package:d_to_d/screens/add_post/add_post_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Login(),
      ),
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
          // GoRoute(
          //   path: '/developer',
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     child: ,
          //   ),
          // ),
          GoRoute(
            path: '/addpost',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: AddPost(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
          ),
          // GoRoute(
          //   path: '/designer',
          //   pageBuilder: (context, state) => NoTransitionPage(
          //     child: ,
          //   ),
          // ),
          GoRoute(
            path: '/setting',
            pageBuilder: (context, state) => NoTransitionPage(
              child: SettingPage(),
            ),
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
