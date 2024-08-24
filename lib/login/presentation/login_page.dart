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
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
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

  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color(0xFF1A1A1A)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Adaptive.h(25), // 25% of screen height
                    width: Adaptive.w(50), // 50% of screen width
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/grg.png',
                      scale: 2,
                    ),
                  ),
                  SizedBox(height: Adaptive.h(4)),
                  Text(
                    'Welcome Member',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: Adaptive.sp(18),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Adaptive.h(4)),
                  SizedBox(
                    width: _getWidthBasedOnScreenType(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                                size: Adaptive.sp(18),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(15),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Adaptive.h(2)),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                                size: Adaptive.sp(18),
                              ),
                            ),
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Adaptive.sp(15),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Adaptive.h(3)),
                          ElevatedButton(
                            onPressed: () async {
                              final stateNotifier =
                                  ref.read(authProvider.notifier);
                              final state = ref.read(authProvider);
                              if (_formKey.currentState!.validate()) {
                                final res = await stateNotifier.signIn(
                                    _usernameController.text,
                                    _passwordController.text);

                                if (stateNotifier.isFirstTime && res == false) {
                                  if (_passwordController.text !=
                                      state.tmpPass) {
                                    _showToast('Check Provided Password');
                                  } else {
                                    context.router.push(UpdatePasswordRoute(
                                        kid: _usernameController.text));
                                  }
                                } else if (!stateNotifier.isFirstTime &&
                                    res == true) {
                                  context.router.push(const DashboardRoute());
                                } else {
                                  _showToast('Invalid Credentials');
                                }
                              }
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: Adaptive.sp(16),
                              ),
                            ),
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

  double _getWidthBasedOnScreenType() {
    switch (Device.screenType) {
      case ScreenType.mobile:
        return 90.w; // Width for mobile screens
      case ScreenType.tablet:
        return 70.w; // Width for tablet screens
      default:
        return 35.w; // Width for desktop screens
    }
  }
}
