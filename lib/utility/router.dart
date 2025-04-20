import 'package:auto_route/auto_route.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/details/details_screen.dart';

part 'router.gr.dart';

part 'route_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DashboardScreenRoute.page, initial: true),
    AutoRoute(page: DetailsScreenRoute.page),
  ];
}
