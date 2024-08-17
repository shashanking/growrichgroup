// auth_repository.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

abstract class IAuthRepository {
  Future<bool> signInWithUsernameAndPassword(String userName, String password);

  Future<bool> signUpWithUsernameAndPassword({
    required String username,
    required String password,
    required String refferedBy,
  });



  Future<void> logout();

  Future<bool> isUserLoggedIn();
  Future<bool> isUserVerified();
  Future<UserModel> getUserModel();

}
