import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/deposit/application/deposit_notifier.dart';
import 'package:growrichgroup_dashboard/deposit/application/deposit_state.dart';

final depositProvider = StateNotifierProvider<DepositNotifier, DepositState>(
    (ref) => DepositNotifier());
