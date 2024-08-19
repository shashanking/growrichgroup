// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/foundation.dart' as _i7;
import 'package:growrichgroup_dashboard/add_member/presentation/add_member_page.dart'
    as _i1;
import 'package:growrichgroup_dashboard/base/presentation/base_screen.dart'
    as _i2;
import 'package:growrichgroup_dashboard/dashboard/presentation/pages/dashboard_page.dart'
    as _i3;
import 'package:growrichgroup_dashboard/login/presentation/login_page.dart'
    as _i4;
import 'package:growrichgroup_dashboard/login/presentation/update_password_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AddMemberRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddMemberPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePasswordRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.UpdatePasswordPage(
          key: args.key,
          kid: args.kid,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMemberPage]
class AddMemberRoute extends _i6.PageRouteInfo<void> {
  const AddMemberRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddMemberRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMemberRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BaseRoute extends _i6.PageRouteInfo<void> {
  const BaseRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UpdatePasswordPage]
class UpdatePasswordRoute extends _i6.PageRouteInfo<UpdatePasswordRouteArgs> {
  UpdatePasswordRoute({
    _i7.Key? key,
    required String kid,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          UpdatePasswordRoute.name,
          args: UpdatePasswordRouteArgs(
            key: key,
            kid: kid,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const _i6.PageInfo<UpdatePasswordRouteArgs> page =
      _i6.PageInfo<UpdatePasswordRouteArgs>(name);
}

class UpdatePasswordRouteArgs {
  const UpdatePasswordRouteArgs({
    this.key,
    required this.kid,
  });

  final _i7.Key? key;

  final String kid;

  @override
  String toString() {
    return 'UpdatePasswordRouteArgs{key: $key, kid: $kid}';
  }
}
