// Flutter imports:
import 'package:adept_labz/features/ui/albums/album_photos.dart';
import 'package:adept_labz/features/ui/dashboard/presentation/dashboard.dart';
import 'package:adept_labz/features/ui/posts/post_details.dart';
import 'package:adept_labz/features/ui/splash_screen/splash_logo_screen.dart';
import 'package:adept_labz/features/ui/splash_screen/splash_screen.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'navigation_provider.dart';
import 'router_path.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: RouterPath.LOGO_SCREEN,
    refreshListenable: notifier,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: RouterPath.SPLASH_SCREEN,
        name: "SPLASH_SCREEN",
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: RouterPath.LOGO_SCREEN,
        name: "LOGO_SCREEN",
        builder: (context, state) => const SplashLogoScreen(),
      ),
      GoRoute(
        path: RouterPath.POST_DETAILS,
        name: "POST_DETAILS",
        builder: (context, state) => PostDetails(
          post: state.extra as PostsResponse,
        ),
      ),
      GoRoute(
        path: RouterPath.ALBUM_PHOTOS,
        name: "ALBUM_PHOTOS",
        builder: (context, state) => const AlbumPhotos(),
      ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) =>
              Dashboard(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: '/',
              name: "DASHBOARD",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: Container(
                  key: state.pageKey,
                ));
              },
            ),
          ])
    ],
    errorBuilder: (context, state) => Container(
      // errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
