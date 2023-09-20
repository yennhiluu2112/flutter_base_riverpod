import 'package:auto_route/auto_route.dart';

import '../../modules/main/home/home_page.dart';
import '../../modules/main/main_page.dart';
import '../../modules/main/settings/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        page: MainRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: SettingsRoute.page)
        ],
      )
    ];
  }
}
