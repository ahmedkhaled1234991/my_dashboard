import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_dashboard/Modules/Products/products_screen.dart';
import 'package:my_dashboard/Widgets/DashboardMenuWidget/dashboard_menu_widget.dart';

import '../Modules/Auth/Login/login_screen.dart';
import '../Modules/Home/ViewSections/home_screen.dart';

class GoRouterConfig {
  static getPath(BuildContext context) => GoRouter.of(context).namedLocation;

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: LoginScreen.routeName,
        pageBuilder: (_, GoRouterState state) {
          return getCustomTransitionPage(
            state: state,
            child: const LoginScreen(),
          );
        },
        routes: const <RouteBase>[],
      ),
      ShellRoute(
        pageBuilder: (_, GoRouterState state, child) {
          return getCustomTransitionPage(
            state: state,
            child: DashboardMenuLayout(
              menuBarRoute: state.fullPath ?? "home",
              onRefresh: () {},
              child: child,
            ),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: HomeScreen.routeName,
            path: "/${HomeScreen.routeName}",
            pageBuilder: (_, GoRouterState state) {
              return getCustomTransitionPage(
                state: state,
                child: const HomeScreen(),
              );
            },
            routes: const <RouteBase>[],
          ),
          GoRoute(
            name: ProductsScreen.routeName,
            path: "/${ProductsScreen.routeName}",
            pageBuilder: (_, GoRouterState state) {
              return getCustomTransitionPage(
                state: state,
                child: const ProductsScreen(),
              );
            },
            routes: const <RouteBase>[],
          ),
        ],
      ),
    ],
    // ignore: body_might_complete_normally_nullable
    // redirect: (BuildContext context, GoRouterState state) {
    //   if(state.matchedLocation == OtpScreen.routeName && state.extra == null){
    //     return ForgotPasswordScreen.routeName;
    //   }
    // },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
