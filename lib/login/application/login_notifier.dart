import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/login/application/login_state.dart';
import 'package:growrichgroup_dashboard/login/domain/i_auth_repository.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';
import 'package:riverpod/riverpod.dart';

// GG1000001
// theamit41

class AuthNotifier extends StateNotifier<LoginState> {
  AuthNotifier(this._authRepository) : super(const LoginState());

  final IAuthRepository _authRepository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isFirstTime = true;
  bool isLoginValid = false;
  String userEmail = '';
  String userId = '';

  Future<bool?> signIn(String username, String password) async {
    state = state.copyWith(isLoading: true);
    isLoginValid = true;

    try {
      final userSnapshot = await _firestore
          .collection('users')
          .where('id', isEqualTo: username)
          .limit(1)
          .get();

      if (userSnapshot.docs.isEmpty) {
        _handleInvalidCredentials();
        return false;
      }

      final userDoc = userSnapshot.docs.first;
      isFirstTime = userDoc.data()['isFirstTime'] ?? true;
      userId = userDoc.data()['id'];
      userEmail = userDoc.data()['emailId'] ?? '';
      final String tmpPass = userDoc.data()['temporaryPassword'] ?? '';
      state = state.copyWith(tmpPass: tmpPass);

      // If it's not the user's first time, proceed to normal sign-in
      if (!isFirstTime) {
        final res = await _authRepository.signInWithUsernameAndPassword(
            username, password);
        state = state.copyWith(isLoading: false);

        if (res) {
          return true;
        } else {
          _handleInvalidCredentials();
          return null;
        }
      }

      // If it's the first time and the password doesn't match the temporary one
      if (_isFirstLoginInvalid(password, tmpPass)) {
        _showToast('Check Provided Password');
        return false;
      }

      // If it's the first time and the password matches the temporary one
      if (isFirstTime && password == tmpPass) {
        state = state.copyWith(isLoading: false);
        return false; // Indicate further action is required
      }

      return null;
    } catch (e) {
      _handleSignInError();
      return false;
    }
  }

  bool _isFirstLoginInvalid(String password, String tmpPass) {
    return isFirstTime && password != tmpPass;
  }

  void _handleInvalidCredentials() {
    state = state.copyWith(isLoading: false);
    _showToast('Invalid credentials.');
  }

  void _handleSignInError() {
    state = state.copyWith(isLoading: false);
    _showToast('An error occurred during sign-in.');
  }

  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  Future<void> updatePassword(
      String email, String password, VoidCallback voidCallBack) async {
    try {
      state = state.copyWith(isLoading: true);
      final finalMail = '$email@growrichgroup.in';

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: finalMail, password: password);

      await FirebaseFirestore.instance.collection('users').doc(email).update({
        'isFirstTime': false,
      }).then((val) async {
        final userSnapshot = await _firestore
            .collection('users')
            .where('id', isEqualTo: email)
            .limit(1)
            .get();
      });
      voidCallBack.call();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      // debugPrint(e);
      state = state.copyWith(isLoading: false);
    }
  }
}
