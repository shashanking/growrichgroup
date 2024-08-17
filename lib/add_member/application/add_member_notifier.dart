// ignore_for_file: parameter_assignments, empty_catches

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final randomNumber = random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  String generateDepositId() {
    const prefix = 'DD';
    final random = Random();
    final randomNumber = random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  Future<bool> registerMember({
    required String name,
    required String phone,
    required String email,
    required String panCard,
    required String depositAmount, // Pass the current user's username as referralID
  }) async {
    state = state.copyWith(isLoading: true);
    final firestore = FirebaseFirestore.instance;

    try {
      // Check if a user already exists with the given phone number, PAN, or email
      final checkPhone =
          await firestore.collection('users').where('phoneNumber', isEqualTo: phone).get();

      final checkEmail =
          await firestore.collection('users').where('emailID', isEqualTo: email).get();

      final checkPan = await firestore.collection('users').where('pan', isEqualTo: panCard).get();

      if (checkPhone.docs.isNotEmpty || checkEmail.docs.isNotEmpty || checkPan.docs.isNotEmpty) {
        // A user with this phone, email, or PAN already exists
        state = state.copyWith(isLoading: false);
        print('userExists');

        return false;
      }

      final newUserId = generateMemberId();
      final newDepositId = generateDepositId();

      // Create a new user

      /**
       * User details required for registering :
       * - Pan card (capital cased)
       * - Phone 
       * - Email
       * - Name
       * - List<Interest> (model)
       *    a. income id
       *    b. interest amount
       *    c. interest type ( non-working | direct-referral | uni-level )
       *    d. updated_at and created_at timestamp
       * - List<Income> (model)
       *    a. income id
       *    b. deposit amount 
       *    c. created_at timestamp
       *    d. updated_at timestamp
       *    e. 
       * - timestamp created_at
       * - timestamp updated_at
       */
      final newUser = UserModel(
        id: newUserId,
        username: name,
        phoneNumber: phone, // deposit ammount missing
        emailId: email,
        depositId: newDepositId,
        pan: panCard.toUpperCase(),
        wallet: const WalletModel(),
        isVerified: false,
        referredIds: [],
      );

      final newDeposit = DepositModel(
        id: newUserId,
        depositId: newDepositId,
        depositAmount: depositAmount,
        depositorName: name,
      );

      // Add the new user to Firestore
      await firestore.collection('users').doc(newUser.id).set(newUser.toJson());

      // Add the new deposit to Firestore
      await firestore.collection('deposits').doc(newDeposit.depositId).set(newDeposit.toJson());

      // Add the new user's ID to the current user's referredIds list
      final currentUserRef = firestore.collection('users').doc(depositAmount);
      await currentUserRef.update({
        'referredIds': FieldValue.arrayUnion([newUserId])
      });

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      // Handle any errors here
      print(e);
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}
