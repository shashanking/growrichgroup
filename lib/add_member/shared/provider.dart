import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/add_member/application/add_member_notifier.dart';
import 'package:growrichgroup_dashboard/add_member/application/add_member_state.dart';

final addMemberProvider =
    StateNotifierProvider<AddMemberNotifier, AddMemberState>(
        (ref) => AddMemberNotifier());
