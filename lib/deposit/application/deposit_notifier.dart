import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/deposit/application/deposit_state.dart';

class DepositNotifier extends StateNotifier<DepositState> {
  DepositNotifier() : super(const DepositState());

    final TextEditingController panController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String paymentMethod = 'cash';
}
