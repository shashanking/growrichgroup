import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/core/constants/app_constants.dart';
import 'package:growrichgroup_dashboard/core/utils/upper_case_text_formatter.dart';
import 'package:growrichgroup_dashboard/dashboard/shared/provider.dart';
import 'package:growrichgroup_dashboard/deposit/presentation/certificate_widget.dart';
import 'package:growrichgroup_dashboard/deposit/shared/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class DepositPage extends ConsumerStatefulWidget {
  const DepositPage({super.key, required this.userId});
  final String userId;

  @override
  ConsumerState<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends ConsumerState<DepositPage> {
  final _formKey = GlobalKey<FormState>();
  final RegExp pancardRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final stateNotifier = ref.read(dashboardProvider.notifier);
      await stateNotifier.getUser();
    });
    super.initState();
  }

  @override
  void dispose() {
    final stateNotifier = ref.read(dashboardProvider.notifier);
    stateNotifier.dispose();
    super.dispose();
  }

  void showSuccessCard(BuildContext context, String depositId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: DepositSuccessCard(depositId: depositId),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.read(dashboardProvider.notifier);
    final state = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w), // Responsive padding
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: 600), // Max width for desktop
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      enabled: false,
                      controller: stateNotifier.panController,
                      decoration: const InputDecoration(
                        labelText: 'PAN',
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the PAN card number';
                        } else if (value.length < 10 ||
                            !pancardRegex.hasMatch(value)) {
                          return 'Please enter valid PAN card number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h), // Responsive spacing
                    DropdownButtonFormField<String>(
                      style: TextStyle(color: Colors.yellow[800]),
                      value: stateNotifier.paymentMethod,
                      onChanged: (String? newValue) {
                        setState(() {
                          stateNotifier.paymentMethod = newValue!;
                        });
                      },
                      items: ['cash', 'card', 'upi'].map((method) {
                        return DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Payment Method',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 2.h), // Responsive spacing
                    TextFormField(
                      controller: stateNotifier.amountController,
                      decoration: const InputDecoration(
                        labelText: 'Deposit Amount',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Deposit Amount';
                        } else if (int.tryParse(value) == null ||
                            int.parse(value) < AppConstants.minimumDeposit) {
                          return 'Deposit amount must be ₹5000 minimum.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 4.h), // Responsive spacing
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _showConfirmationDialog(
                            context,
                            () async {
                              final res = await stateNotifier.addTopUp();
                              if (res) {
                                showSuccessCard(context, state.topUpId);
                              }
                            },
                            stateNotifier.amountController.text,
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showConfirmationDialog(
    BuildContext context, VoidCallback callback, String amount) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Action'),
        content: Text(
          'This will Deposit new topup incomes:\n'
          'Amount : $amount\n'
          'Do you want to proceed?',
          style: const TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // write a function to trigger a non-working income
              // & uni-level income for their referral chain of each user
              callback.call();
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
