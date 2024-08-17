import 'package:growrichgroup_dashboard/services/auth_service.dart';
import 'package:growrichgroup_dashboard/login/application/login_state.dart';
import 'package:riverpod/riverpod.dart';

import '../application/login_notifier.dart';

final authProvider = StateNotifierProvider<AuthNotifier, LoginState>(
    (ref) => AuthNotifier(FirebaseAuthRepository()));
