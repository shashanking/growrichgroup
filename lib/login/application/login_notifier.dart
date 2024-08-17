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
      final userSnapshot = await _firestore
          .collection('users')
          .where('id', isEqualTo: username)
          // .limit(1)
          .get();

      print(userSnapshot.docs.first.data());

      if (userSnapshot.docs.isNotEmpty) {
        final userDoc = userSnapshot.docs.first;

        final bool isFirstTime = userDoc.data()['isFirstTime'] ?? true;
        final String userId = userDoc.data()['id'];
        final String userEmail = userDoc.data()['emailId'];
        final String temporaryPassword = userDoc.data()['temporaryPassword'];

        if (isFirstTime) {
          // 2. If it's the user's first login, add them to the _authRepository
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: userEmail, password: password);

          //   // 3. Prompt the user to change their password
          //   state = state.copyWith(
          //     isLoading: false,
          //     isVerified: true,
          //   );
          return true; // Indicate further action is required
        } else {
          //   // 4. If not the first login, authenticate the user
          await _authRepository.signInWithUsernameAndPassword(username, password);
          //   state = state.copyWith(
          //     isLoading: false,
          //     isAuthenticated: true,
          //   );
          return true;
        }
      }

      // bool res = await _authRepository.signInWithUsernameAndPassword(username, password);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false);

      return false;
    }
  }
}
