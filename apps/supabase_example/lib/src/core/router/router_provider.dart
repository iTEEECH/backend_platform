import 'package:supabase_example/src/core/router/routes/route_location.dart';
import 'package:supabase_example/src/core/router/routes/route_name.dart';
import 'package:supabase_example/src/features/authentication/authentication.dart';
import 'package:supabase_example/src/features/home/home.dart';
import 'package:supabase_example/src/features/sign_in/sign_in.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'router_provider.g.dart';

@riverpod
Raw<GoRouter> router(Ref ref) {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Router');

  final AsyncValue<AuthState?> authenticationState = ref.watch(authenticationControllerProvider);


  final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    redirect: (BuildContext context, GoRouterState state) {
      if (authenticationState.isLoading || authenticationState.hasError) {
        return RouteLocation.login;
      }

      final bool isAuthenticated = authenticationState.valueOrNull?.session != null;

      if (state.matchedLocation == RouteLocation.login) {
        isAuthenticated ? RouteName.home : null;
      }

      return isAuthenticated ? null : RouteLocation.login;
    },
    routes: <RouteBase>[
      GoRoute(
        path: RouteLocation.home,
        name: RouteName.home,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomePage(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutExpo).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: RouteLocation.login,
        name: RouteName.login,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: SignInPage(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutExpo).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
