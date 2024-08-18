import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:growrichgroup_dashboard/login/application/login_state.dart';
import 'package:growrichgroup_dashboard/login/domain/i_auth_repository.dart';
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

  Future<bool> signIn(String username, String password) async {
    state = state.copyWith(isLoading: true);

    isLoginValid = true;

    try {
      final userSnapshot =
          await _firestore.collection('users').where('id', isEqualTo: username).limit(1).get();

      if (userSnapshot.docs.isNotEmpty) {
        final userDoc = userSnapshot.docs.first;

        isFirstTime = userDoc.data()['isFirstTime'] ?? true;
        userId = userDoc.data()['id'];
        userEmail = userDoc.data()['emailId'] ?? '';
        // final String temporaryPassword = userDoc.data()['temporaryPassword'];

        if (isFirstTime) {
          // 2. If it's the user's first login, add them to the _authRepository
          // await FirebaseAuth.instance
          //     .createUserWithEmailAndPassword(email: userEmail, password: password);

          //   // 3. Prompt the user to change their password
          //   state = state.copyWith(
          //     isLoading: false,
          //     isVerified: true,
          //   );
          state = state.copyWith(isLoading: false);
          return false; // Indicate further action is required
        } else {
          //   // 4. If not the first login, authenticate the user
          await _authRepository.signInWithUsernameAndPassword(username, password);
          //   state = state.copyWith(
          //     isLoading: false,
          //     isAuthenticated: true,
          //   );
          state = state.copyWith(isLoading: false);
          return true;
        }
      } else {
        // Handle invalid credentials
        state = state.copyWith(isLoading: false);
        return false;
      }

      // bool res = await _authRepository.signInWithUsernameAndPassword(username, password);
    } catch (e) {
      state = state.copyWith(isLoading: false);

      return false;
    }
  }

  Future<void> updatePassword(String password, VoidCallback voidCallBack) async {
    try {
      state = state.copyWith(isLoading: true);

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'isFirstTime': false,
      });
      voidCallBack.call();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      // print(e);
      state = state.copyWith(isLoading: false);
    }
  }
}
