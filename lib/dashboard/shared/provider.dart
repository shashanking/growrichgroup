import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_notifier.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_state.dart';

final dashbaordProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
        (ref) => DashboardNotifier());
