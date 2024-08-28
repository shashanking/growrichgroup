import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growrichgroup_dashboard/core/constants/app_constants.dart';
import 'package:growrichgroup_dashboard/deposit/application/deposit_state.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

class DepositNotifier extends StateNotifier<DepositState> {
  DepositNotifier() : super(const DepositState());

  final TextEditingController panController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String paymentMethod = 'cash';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to extract the part before @ from the email
  String extractEmailPrefix(String email) {
    return email.split('@')[0].toUpperCase();
  }

  

  Future<void> getUser() async {
    try {
      if (_auth.currentUser != null) {
        final userMail = _auth.currentUser!.email!;
        final userID = extractEmailPrefix(userMail);
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userID).get();
        if (userDoc.exists) {
          UserModel userFromModel =
              UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

          // Save user's data to local storage
          // await saveUserDataLocally(userFromModel);

          state = state.copyWith(
            uid: userID,
            isLoading: false,
            user: userFromModel,
            isAdmin: state.uid == AppConstants.adminId ? true : false,
          );

          if (state.uid == AppConstants.adminId) {
            state = state.copyWith(isAdmin: true);
          }
          panController.text = state.user?.pan ?? '';

          debugPrint('user');
        } else {
          debugPrint('user doc not found');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
