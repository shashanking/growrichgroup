import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/add_member/shared/provider.dart';
import 'package:growrichgroup_dashboard/core/utils/upper_case_text_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class AddMemberPage extends ConsumerStatefulWidget {
  const AddMemberPage({super.key});

  @override
  ConsumerState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends ConsumerState<AddMemberPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _panCardController = TextEditingController();
  final _referralIDController = TextEditingController();
  final _depositAmountController = TextEditingController();

  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  final RegExp pancardRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _panCardController.dispose();
    _referralIDController.dispose();
    _depositAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(AddMemberProvider.notifier);
    final newUser = ref.watch(AddMemberProvider).newUser; // Watching the new user state

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Member')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: kIsWeb ? 30.w : 90.w,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Phone Number Field
                TextFormField(
                  controller: _phoneController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Email ID Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email ID';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // PAN Card Field
                TextFormField(
                  controller: _panCardController,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'PAN Card',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the PAN card number';
                    } else if (value.length < 10 || !pancardRegex.hasMatch(value)) {
                      return 'Please enter a valid PAN card number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Deposit Amount
                TextFormField(
                  controller: _depositAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Deposit Amount',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Deposit Amount';
                    } else if (int.parse(_depositAmountController.text) < 5000) {
                      return 'Deposit amount must be ₹5000 minimum.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Add Member Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add member logic
                      notifier.registerMember(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        panCard: _panCardController.text,
                        depositAmount: _depositAmountController.text,
                      );

                      // Clear the form fields after submission
                      _nameController.clear();
                      _phoneController.clear();
                      _emailController.clear();
                      _panCardController.clear();
                      _referralIDController.clear();
                      _depositAmountController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Add Member'),
                ),
                const SizedBox(height: 24),

                // Show new user details after form submission
                if (newUser != null) ...[
                  const Text('New User Details:'),
                  const SizedBox(height: 8),
                  Text('Username: ${newUser.id}'),
                  Text('Name: ${newUser.username}'),
                  Text('Temporary passord: ${newUser.temporaryPassword}'),
                  // Text('Deposit Amount: ${newUser.depositAmount}'),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
