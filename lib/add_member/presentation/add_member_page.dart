import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/add_member/shared/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class AddMemberPage extends ConsumerStatefulWidget {
  AddMemberPage();

  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends ConsumerState<AddMemberPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _panCardController = TextEditingController();
  final _referralIDController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _panCardController.dispose();
    _referralIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifer = ref.read(AddMemberProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Add New Member')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Phone Number Field
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Email ID Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // PAN Card Field
                TextFormField(
                  controller: _panCardController,
                  decoration: InputDecoration(
                    labelText: 'PAN Card',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the PAN card number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Referral ID Field
                TextFormField(
                  controller: _referralIDController,
                  decoration: InputDecoration(
                    labelText: 'Deposit Amount',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Depoisit Amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),

                // Add Member Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add member logic
                      notifer.registerMember(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        panCard: _panCardController.text,
                        depositAmount: _referralIDController.text,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Add Member'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
