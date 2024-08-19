// firebase_auth_repository.dart

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/login/domain/i_auth_repository.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

class FirebaseAuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _generateUniqueCode() {
    var now = DateTime.now().millisecondsSinceEpoch;

    var base36Encoded = now.toRadixString(36).toUpperCase();

    if (base36Encoded.length > 8) {
      base36Encoded = base36Encoded.substring(base36Encoded.length - 8);
    } else if (base36Encoded.length < 8) {
      int neededPadding = 8 - base36Encoded.length;
      var rng = Random();
      String padding = List.generate(neededPadding,
          (_) => rng.nextInt(36).toRadixString(36).toUpperCase()).join('');
      base36Encoded = padding + base36Encoded;
    }

    return base36Encoded;
  }

  Future<String> _generateUniqueReferralCode() async {
    String newCode = '';
    bool isUnique = false;

    while (!isUnique) {
      newCode = _generateUniqueCode();
      var existingCode = await _firestore
          .collection('usernames')
          .where('referralCode', isEqualTo: newCode)
          .get();

      if (existingCode.docs.isEmpty) {
        isUnique = true;
      }
    }

    return newCode;
  }

  @override
  Future<bool> signUpWithUsernameAndPassword({
    required String username,
    required String password,
    required String refferedBy,
  }) async {
    try {
      var existingEmail =
          await _firestore.collection('usernames').doc(username).get();
      if (existingEmail.exists) {
        throw FirebaseAuthException(
          code: 'username-already-in-use',
          message: 'Username is already taken.',
        );
      }

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: '$username@growrichgroup.in',
        password: password,
      );

      final String referralCode = await _generateUniqueReferralCode();

      final UserModel user = UserModel(
        username: username,
        id: userCredential.user!.uid,
        pan: referralCode,
      );

      Map<String, dynamic> data = {
        'username': user.username,
        'phoneNumber': user.phoneNumber,
        'email': userCredential.user!.email,
        'isVerified': user.isVerified,
        // 'wallet': user.wallet.toJson(),
        'id': user.id,
        'referralCode': referralCode,
        'referredBy': refferedBy,
        'createdAt': DateTime.timestamp()
      };
      // print(data);

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(data);

      await _firestore.collection('usernames').doc(username).set({
        'userId': userCredential.user!.uid,
        'referralCode': referralCode,
      });

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  @override
  Future<bool> signInWithUsernameAndPassword( // in use
      String username, String password) async {
    var email = await _getEmailForUsername(username);
    if (email == null) {
      throw FirebaseAuthException(
        code: 'user-not-found',
        message: 'No user found for that username.',
      );
    }

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // print('Sign-in successful.');
      return true;
    } catch (e) {
      // print('Sign-in failed: $e');
      return false;
    }
  }

  Future<String?> _getEmailForUsername(String username) async {
    if (username.isEmpty) {
      return null;
    }

    return "$username@growrichgroup.in";
  }

  @override
  Future<void> logout() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<bool> isUserVerified() async {
    try {
      var userDoc = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found with that username.',
        );
      }
      var isVerified = userDoc.data()?['isVerified'];
      return isVerified ?? false;
    } catch (e) {
      throw FirebaseAuthException(
        code: 'user-verification-error',
        message: 'Error occurred while verifying user.',
      );
    }
  }

  @override
  Future<UserModel> getUserModel() async {
    try {
      var userDoc = await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found with that ID.',
        );
      }
      var userData = userDoc.data();
      if (userData == null) {
        throw FirebaseAuthException(
          code: 'data-not-found',
          message: 'User data is null.',
        );
      }

      return UserModel.fromJson(userData);
    } catch (e) {
      throw FirebaseAuthException(
        code: 'user-fetch-error',
        message: 'Error occurred while fetching user data: $e',
      );
    }
  }
}
