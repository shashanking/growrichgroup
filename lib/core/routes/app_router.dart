import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
        AutoRoute(page: DashboardRoute.page, path: '/dashboard'),
        AutoRoute(page: AddMemberRoute.page, path: '/onboarding'),
        AutoRoute(page: UpdatePasswordRoute.page, path: '/update-password'),
        AutoRoute(page: ReferralListRoute.page, path: '/referral-list'),
        AutoRoute(page: DepositRoute.page, path: '/deposit'),
      ];
}
