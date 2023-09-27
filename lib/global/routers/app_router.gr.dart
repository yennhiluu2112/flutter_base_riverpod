// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    AuthorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorsPage(),
      );
    },
    AuthorDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthorDetailPage(
          user: args.user,
          key: args.key,
        ),
      );
    },
    UpsertPostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpsertPostPage(),
      );
    },
  };
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthorsPage]
class AuthorsRoute extends PageRouteInfo<void> {
  const AuthorsRoute({List<PageRouteInfo>? children})
      : super(
          AuthorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthorDetailPage]
class AuthorDetailRoute extends PageRouteInfo<AuthorDetailRouteArgs> {
  AuthorDetailRoute({
    required User user,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AuthorDetailRoute.name,
          args: AuthorDetailRouteArgs(
            user: user,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthorDetailRoute';

  static const PageInfo<AuthorDetailRouteArgs> page =
      PageInfo<AuthorDetailRouteArgs>(name);
}

class AuthorDetailRouteArgs {
  const AuthorDetailRouteArgs({
    required this.user,
    this.key,
  });

  final User user;

  final Key? key;

  @override
  String toString() {
    return 'AuthorDetailRouteArgs{user: $user, key: $key}';
  }
}

/// generated route for
/// [UpsertPostPage]
class UpsertPostRoute extends PageRouteInfo<void> {
  const UpsertPostRoute({List<PageRouteInfo>? children})
      : super(
          UpsertPostRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpsertPostRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
