// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i9;
import 'package:growrichgroup_dashboard/add_member/presentation/add_member_page.dart'
    as _i1;
import 'package:growrichgroup_dashboard/base/presentation/base_screen.dart'
    as _i2;
import 'package:growrichgroup_dashboard/dashboard/presentation/pages/dashboard_page.dart'
    as _i3;
import 'package:growrichgroup_dashboard/dashboard/presentation/pages/referral_list_page.dart'
    as _i6;
import 'package:growrichgroup_dashboard/deposit/presentation/deposit_page.dart'
    as _i4;
import 'package:growrichgroup_dashboard/login/presentation/login_page.dart'
    as _i5;
import 'package:growrichgroup_dashboard/login/presentation/update_password_page.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddMemberRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddMemberPage(),
      );
    },
    BaseRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    DepositRoute.name: (routeData) {
      final args = routeData.argsAs<DepositRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DepositPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    ReferralListRoute.name: (routeData) {
      final args = routeData.argsAs<ReferralListRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ReferralListPage(
          key: args.key,
          userId: args.userId,
          depositId: args.depositId,
        ),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePasswordRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.UpdatePasswordPage(
          key: args.key,
          kid: args.kid,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMemberPage]
class AddMemberRoute extends _i8.PageRouteInfo<void> {
  const AddMemberRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AddMemberRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMemberRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BaseRoute extends _i8.PageRouteInfo<void> {
  const BaseRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DepositPage]
class DepositRoute extends _i8.PageRouteInfo<DepositRouteArgs> {
  DepositRoute({
    _i9.Key? key,
    required String userId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DepositRoute.name,
          args: DepositRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'DepositRoute';

  static const _i8.PageInfo<DepositRouteArgs> page =
      _i8.PageInfo<DepositRouteArgs>(name);
}

class DepositRouteArgs {
  const DepositRouteArgs({
    this.key,
    required this.userId,
  });

  final _i9.Key? key;

  final String userId;

  @override
  String toString() {
    return 'DepositRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ReferralListPage]
class ReferralListRoute extends _i8.PageRouteInfo<ReferralListRouteArgs> {
  ReferralListRoute({
    _i9.Key? key,
    required String userId,
    required String depositId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ReferralListRoute.name,
          args: ReferralListRouteArgs(
            key: key,
            userId: userId,
            depositId: depositId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReferralListRoute';

  static const _i8.PageInfo<ReferralListRouteArgs> page =
      _i8.PageInfo<ReferralListRouteArgs>(name);
}

class ReferralListRouteArgs {
  const ReferralListRouteArgs({
    this.key,
    required this.userId,
    required this.depositId,
  });

  final _i9.Key? key;

  final String userId;

  final String depositId;

  @override
  String toString() {
    return 'ReferralListRouteArgs{key: $key, userId: $userId, depositId: $depositId}';
  }
}

/// generated route for
/// [_i7.UpdatePasswordPage]
class UpdatePasswordRoute extends _i8.PageRouteInfo<UpdatePasswordRouteArgs> {
  UpdatePasswordRoute({
    _i10.Key? key,
    required String kid,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          UpdatePasswordRoute.name,
          args: UpdatePasswordRouteArgs(
            key: key,
            kid: kid,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const _i8.PageInfo<UpdatePasswordRouteArgs> page =
      _i8.PageInfo<UpdatePasswordRouteArgs>(name);
}

class UpdatePasswordRouteArgs {
  const UpdatePasswordRouteArgs({
    this.key,
    required this.kid,
  });

  final _i10.Key? key;

  final String kid;

  @override
  String toString() {
    return 'UpdatePasswordRouteArgs{key: $key, kid: $kid}';
  }
}
