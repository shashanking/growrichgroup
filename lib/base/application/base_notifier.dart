// ignore_for_file: parameter_assignments, empty_catches

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_state.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier() : super(const BaseState());

  void tapBottomNavIndex(int value) {
    state = state.copyWith(lastBottomNavIndex: state.bottomNavIndex);
    state = state.copyWith(bottomNavIndex: value);
  }

  void resetBottomNavigation() {
    state = state.copyWith(bottomNavIndex: 0);
  }

  void backToPreviousScreen() {
    state = state.copyWith(bottomNavIndex: state.lastBottomNavIndex);
  }

  void resetBottomNavIndex() {
    state = state.copyWith(bottomNavIndex: 0);
    state = state.copyWith(lastBottomNavIndex: 0);
  }
}
