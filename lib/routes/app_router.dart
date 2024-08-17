import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, path: '/dashboard'),
        AutoRoute(page: AddMemberRoute.page, path: '/onboarding'),
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
      ];
}
