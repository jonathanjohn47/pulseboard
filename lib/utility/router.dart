import 'package:auto_route/auto_route.dart';
import 'package:pulseboard/screens/settings_screen.dart';

import '../screens/dashboard_screen.dart';
import '../screens/details_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardScreenRoute.page, initial: true),
    AutoRoute(page: DetailsScreenRoute.page),
    AutoRoute(page: SettingsScreenRoute.page),
  ];
}
