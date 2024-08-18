// lib/presentation/pages/login_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/login/shared/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/routes/app_router.gr.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider.select((state) => state.isLoading));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color(0xFF1A1A1A)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: Image.asset(
                      'assets/images/grg.png',
                      scale: 2,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Welcome Member',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: kIsWeb ? 35.w : 90.w,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
                            ),
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () async {
                              final stateNotifier = ref.read(authProvider.notifier);
                              if (!isLoading) {
                                await stateNotifier.signIn(
                                    _usernameController.text, _passwordController.text);
                                if (!stateNotifier.isLoginValid) {
                                  return;
                                } else if (stateNotifier.isFirstTime) {
                                  context.router.push(const UpdatePasswordRoute());
                                } else if (stateNotifier.isFirstTime == false) {
                                  context.router.push(const DashboardRoute());
                                } else {
                                  await Fluttertoast.showToast(msg: 'Invalid Credentials');
                                }
                              }
                            },
                            child: Text('LOGIN', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
