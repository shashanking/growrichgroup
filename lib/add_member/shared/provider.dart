import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/add_member/application/add_member_notifier.dart';
import 'package:growrichgroup_dashboard/add_member/application/add_member_state.dart';
import 'package:growrichgroup_dashboard/login/application/login_notifier.dart';

import '../../services/auth_service.dart';

final AddMemberProvider =
    StateNotifierProvider<AddMemberNotifier, AddMemberState>(
        (ref) => AddMemberNotifier());
