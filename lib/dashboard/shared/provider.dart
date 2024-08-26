import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_notifier.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_state.dart';
import 'package:growrichgroup_dashboard/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).asData?.value;
  if (sharedPreferences == null) {
    throw UnimplementedError("SharedPreferences is not yet available");
  }

  return DashboardNotifier(LocalStorageService(sharedPreferences));
});

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
});
