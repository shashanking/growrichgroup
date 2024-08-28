import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/add_member/shared/provider.dart';
import 'package:growrichgroup_dashboard/core/constants/app_constants.dart';
import 'package:growrichgroup_dashboard/core/utils/upper_case_text_formatter.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      final notifier = ref.read(addMemberProvider.notifier);
    });
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(addMemberProvider.notifier);
    final state = ref.watch(addMemberProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Member')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: SizedBox(
          width: Device.screenType == ScreenType.desktop ? 30.w : 90.w,
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
                SizedBox(height: 16.sp),

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
                SizedBox(height: 16.sp),

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
                SizedBox(height: 16.sp),

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
                    } else if (value.length < 10 ||
                        !pancardRegex.hasMatch(value)) {
                      return 'Please enter a valid PAN card number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.sp),

                // Deposit Amount
                TextFormField(
                  controller: _depositAmountController,
                  decoration: const InputDecoration(
                    labelText: 'Deposit Amount',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
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
                SizedBox(height: 24.sp),

                // Add Member Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Add member logic
                      await notifier.registerMember(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        panCard: _panCardController.text,
                        depositAmount: _depositAmountController.text,
                      );

                      // Listen for changes in newUser and show dialog when data is available
                      await notifier.addListener((state) {
                        final newUser = state.newUser;
                        if (newUser != null) {
                          _showNewUserDetailsDialog(context, newUser);
                        }
                      });

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
                    padding: EdgeInsets.symmetric(vertical: 16.sp),
                  ),
                  child: const Text('Add Member'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showNewUserDetailsDialog(BuildContext context, UserModel newUser) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        contentPadding: EdgeInsets.all(16.sp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New User Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.sp),
            SelectableText(
              'ID: ${newUser.id}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            SelectableText(
              'Name: ${newUser.username}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            SelectableText(
              'Temporary password: ${newUser.temporaryPassword}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 24.sp),
            const Text(
              'Note: Please make sure to take a note of the above details.',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 24.sp),
            ),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              // Copy the user details to the clipboard
              Clipboard.setData(
                ClipboardData(
                  text:
                      'ID: ${newUser.id}\nName: ${newUser.username}\nTemporary Password: ${newUser.temporaryPassword}',
                ),
              );
              // Show a toast message
              Fluttertoast.showToast(
                msg: "User details copied to clipboard!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.orangeAccent,
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 24.sp),
            ),
            child: const Text(
              'Copy',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 24.sp),
            ),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      );
    },
  );
}
