// ignore_for_file: parameter_assignments, empty_catches

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/login/domain/deposit_model.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';
import 'add_member_state.dart';

class AddMemberNotifier extends StateNotifier<AddMemberState> {
  AddMemberNotifier() : super(const AddMemberState());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String generateMemberId() {
    const prefix = 'GG';
    final random = Random();
    final randomNumber =
        random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  String generateDepositId() {
    const prefix = 'DD';
    final random = Random();
    final randomNumber =
        random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  String generateTemporaryPassword() {
    const prefix = 'PW';
    final random = Random();
    final randomNumber =
        random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  // Function to extract the part before @ from the email
  String extractEmailPrefix(String email) {
    return email.split('@')[0].toUpperCase();
  }

  Future<void> registerMember({
    required String name,
    required String phone,
    required String email,
    required String panCard,
    required String depositAmount,
  }) async {
    state = state.copyWith(isLoading: true);

    try {
      if (await _doesUserExist(phone: phone, email: email, panCard: panCard)) {
        Fluttertoast.showToast(msg: 'User already exists');
        state = state.copyWith(isLoading: false);
        return;
      }

      final newUserId = generateMemberId();
      final newDepositId = generateDepositId();
      final temporaryPassword = generateTemporaryPassword();

      final User? user = _auth.currentUser;
      if (user != null) {
        final referredByUser =
            _getReferredByUser(extractEmailPrefix(user.email!));
        final newUser = _createNewUser(
          userId: newUserId,
          name: name,
          phone: phone,
          email: email,
          panCard: panCard,
          temporaryPassword: temporaryPassword,
          referredByUser: referredByUser,
          newDepositId: newDepositId,
        );

        final newDeposit = _createNewDeposit(
          newUserId: newUserId,
          newDepositId: newDepositId,
          depositAmount: depositAmount,
          depositorName: name,
        );

        await _saveNewUserAndDeposit(newUser, newDeposit);
        await _updateReferredIds(referredByUser, newUserId);

        state = state.copyWith(newUser: newUser);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      debugPrint(e.toString());
      state = state.copyWith(isLoading: false);
    }
  }

// Function to check if a user already exists
  Future<bool> _doesUserExist({
    required String phone,
    required String email,
    required String panCard,
  }) async {
    final checkPhone = await _firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: phone)
        .get();

    final checkEmail = await _firestore
        .collection('users')
        .where('emailID', isEqualTo: email)
        .get();

    final checkPan = await _firestore
        .collection('users')
        .where('pan', isEqualTo: panCard)
        .get();

    return checkPhone.docs.isNotEmpty ||
        checkEmail.docs.isNotEmpty ||
        checkPan.docs.isNotEmpty;
  }

// Function to extract referredBy user from email
  String _getReferredByUser(String email) {
    return extractEmailPrefix(email).toUpperCase();
  }

// Function to create a new user model
  UserModel _createNewUser({
    required String userId,
    required String name,
    required String phone,
    required String email,
    required String panCard,
    required String temporaryPassword,
    required String referredByUser,
    required String newDepositId,
  }) {
    return UserModel(
      id: userId,
      username: name,
      phoneNumber: phone,
      emailId: email,
      depositId: [newDepositId],
      temporaryPassword: temporaryPassword,
      pan: panCard.toUpperCase(),
      isVerified: false,
      referredBy: referredByUser,
      referredIds: [],
      interests: [],
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
    );
  }

// Function to create a new deposit model
  DepositModel _createNewDeposit({
    required String newUserId,
    required String newDepositId,
    required String depositAmount,
    required String depositorName,
  }) {
    return DepositModel(
      id: newUserId,
      depositId: newDepositId,
      depositAmount: depositAmount,
      depositorName: depositorName,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
    );
  }

// Function to save the new user and deposit to Firestore
  Future<void> _saveNewUserAndDeposit(
      UserModel newUser, DepositModel newDeposit) async {
    await _firestore
        .collection('deposits')
        .doc(newDeposit.depositId)
        .set(newDeposit.toJson());

    await _firestore.collection('users').doc(newUser.id).set(newUser.toJson());
  }

// Function to update referred IDs of the referrer
  Future<void> _updateReferredIds(
      String referredByUser, String newUserId) async {
    final currentUserRef = _firestore.collection('users').doc(referredByUser);
    await currentUserRef.update({
      'referredIds': FieldValue.arrayUnion([newUserId])
    });
  }
}
