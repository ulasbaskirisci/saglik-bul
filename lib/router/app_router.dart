import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/view/not_found_screen.dart';
import '../core/view/splash_screen.dart';
import '../features/provider/detail/view/provider_detail_screen.dart';
import '../features/provider/list/view/provider_list_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        ),
      ),
      GoRoute(
        path: '/list',
        name: 'list',
        builder: (context, state) => const ProviderListScreen(),
      ),
      GoRoute(
        path: '/detail/:id',
        name: 'detail',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: ProviderDetailScreen(providerId: id),
            transitionDuration: const Duration(milliseconds: 350),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                  reverseCurve: Curves.easeInCubic,
                ),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
