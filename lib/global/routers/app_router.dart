import 'package:auto_route/auto_route.dart';
import 'package:flutter_base_riverpod/global/routers/auth_guard.dart';

import '../../modules/main/home/home_page.dart';
import '../../modules/main/main_page.dart';
import '../../modules/main/settings/settings_page.dart';
import '../../modules/sign_in/sign_in_page.dart';
import '../../modules/sign_up/sign_up_page.dart';
import '../../modules/splash/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page, initial: true),
      AutoRoute(page: SignInRoute.page),
      AutoRoute(page: SignUpRoute.page),
      AutoRoute(
        page: MainRoute.page,
        guards: [AuthGuard()],
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: SettingsRoute.page)
        ],
      )
    ];
  }
}
