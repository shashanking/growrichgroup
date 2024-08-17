// auth_notifier.dart
// ignore_for_file: unnecessary_const

import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:growrichgroup_dashboard/login/application/login_state.dart';
import 'package:growrichgroup_dashboard/login/domain/i_auth_repository.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';
import 'package:riverpod/riverpod.dart';

class AuthNotifier extends StateNotifier<LoginState> {
  final IAuthRepository _authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier(this._authRepository) : super(const LoginState());

  Future<bool> signIn(String username, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      bool res = await _authRepository.signInWithUsernameAndPassword(
          username, password);

      state = state.copyWith(isLoading: false);
      return res;
    } catch (e) {
      state = state.copyWith(isLoading: false);

      return false;
    }
  }
}
