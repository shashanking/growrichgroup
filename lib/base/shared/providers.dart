import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/base_notifier.dart';
import '../application/base_state.dart';

final baseNotifierProvider =
    StateNotifierProvider<BaseNotifier, BaseState>((ref) => BaseNotifier());
