// ignore_for_file: parameter_assignments, empty_catches

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_state.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(const DashboardState());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String generateDirectReferralIncomeId() {
    const prefix = 'DR';
    final random = Random();
    final randomNumber =
        random.nextInt(9000000) + 1000000; // Ensures a 7-digit number
    return '$prefix$randomNumber';
  }

  // Function to extract the part before @ from the email
  String extractEmailPrefix(String email) {
    return email.split('@')[0].toUpperCase();
  }

  Future<void> fetchReferredUsers() async {
    try {
      final List<UserModel> referredUsersList = [];
      DocumentSnapshot referredUserDoc =
          await _firestore.collection('users').doc(state.uid).get();

      if (referredUserDoc.exists) {
        List<String> referralIds =
            (referredUserDoc['referredIds'] as List<dynamic>)
                .map((e) => e as String)
                .toList();

        for (String id in referralIds) {
          final userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(id)
              .get();
          if (userDoc.exists) {
            referredUsersList.add(UserModel.fromJson(userDoc.data()!));
          }
        }

        state = state.copyWith(referredUsersList: referredUsersList);
      }
    } catch (e) {
      // Handle errors appropriately in production
      print('Error fetching referred users: $e');
    }
  }

  Future<void> getUser() async {
    String depositAmount = '';
    try {
      if (_auth.currentUser != null) {
        final userMail = _auth.currentUser!.email!;
        final userID = extractEmailPrefix(userMail);
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(userID).get();
        if (userDoc.exists) {
          UserModel userFromModel =
              UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          List<String> depositIds = (userDoc['depositId'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

          DocumentSnapshot depositDoc = await _firestore
              .collection('deposits')
              .doc(depositIds.last)
              .get();
          if (depositDoc.exists) {
            depositAmount = depositDoc['depositAmount'];
          }

          final sum = await totalIncome(userFromModel.interests!);

          state = state.copyWith(
            uid: userID,
            depositId: depositIds.last,
            depositAmount: depositAmount,
            user: userFromModel,
            noOfIncome: userFromModel.interests?.length ?? 0,
            totalIncome: sum,
            isLoading: false,
          );

          debugPrint('user');
        } else {
          debugPrint('user doc not found');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<double> totalIncome(List<IncomeModel>? intersts) async {
    if (intersts == null || intersts.isEmpty) {
      return 0.00;
    }

    double total = 0.00;
    for (var income in intersts) {
      total += double.tryParse(income.incomeAmount) ?? 0.00;
    }

    return total;
  }

  Future<void> distributeReferralIncome(
      {required String userId, required String depositId}) async {
    try {
      // Fetch the user document by userId
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      DocumentSnapshot depositDoc =
          await _firestore.collection('deposits').doc(depositId).get();

      if (userDoc.exists && depositDoc.exists) {
        String? referredById = userDoc['referredBy'];
        String incomeFromUser = depositDoc['id'] ?? '';
        double depositAmount = double.parse(depositDoc['depositAmount']);
        int level = 1;

        // Start the level-wise distribution of interest
        while (referredById != null && level <= 20) {
          // Fetch the referred user's document
          DocumentSnapshot referredUserDoc =
              await _firestore.collection('users').doc(referredById).get();

          if (referredUserDoc.exists) {
            List<String> referralIds =
                (referredUserDoc['referredIds'] as List<dynamic>)
                    .map((e) => e as String)
                    .toList();

            // Check if the referred user meets the direct referrals condition for this level
            if (meetsDirectReferralCondition(level, referralIds.length)) {
              double interestPercentage = getInterestPercentage(level);
              double interestAmount = depositAmount * interestPercentage / 100;

              // Add the interest to the referred user's document
              await addInterestToUser(referredUserDoc.id, interestAmount,
                  depositId, incomeFromUser);
            } else {
              debugPrint(
                  'Member at level $level : ${referredUserDoc['id']} does not meet the direct referral condition.');
            }

            // Move to the next level
            referredById =
                referredUserDoc['referredBy']; // Get the next referredBy ID
            if (referredById == null) {
              break;
            }
            level++;
          } else {
            break; // Stop if the referred user document does not exist
          }
        }
      } else {
        debugPrint('User document not found for ID: $userId');
      }
    } catch (e) {
      debugPrint('Error distributing referral income: $e');
    }
  }

  bool meetsDirectReferralCondition(int level, int directReferralCount) {
    if (level <= 2 && directReferralCount >= 1) {
      return true;
    } else if (level <= 5 && directReferralCount >= 2) {
      return true;
    } else if (level <= 10 && directReferralCount >= 3) {
      return true;
    } else if (level <= 20 && directReferralCount >= 4) {
      return true;
    } else {
      return false; // Does not meet the condition
    }
  }

  double getInterestPercentage(int level) {
    if (level == 1) {
      return 5.0;
    } else if (level == 2) {
      return 2.0;
    } else if (level >= 3 && level <= 10) {
      return 1.0;
    } else if (level >= 11 && level <= 20) {
      return 0.5;
    } else {
      return 0.0; // No interest for levels beyond 20
    }
  }

  Future<void> addInterestToUser(String userId, double interestAmount,
      String depositId, String incomeFromUser) async {
    await _firestore.collection('users').doc(userId).update({
      'interests': FieldValue.arrayUnion([
        IncomeModel(
          incomeId: generateDirectReferralIncomeId(),
          depositId: depositId,
          incomeFromUser: incomeFromUser,
          incomeAmount: interestAmount.toString(),
          incomeType: 'direct-referral-income',
          createdAt: DateTime.timestamp(),
          updatedAt: DateTime.timestamp(),
        ).toJson()
      ]),
    });
  }

  Future<void> checkUserVerification() async {
    // Set loading to true to block the UI
    state = state.copyWith(isLoading: true);

    final userRef = _firestore.collection('users').doc(state.uid);

    try {
      // Fetch the user's document from Firestore
      final userDoc = await userRef.get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null && userData['isVerified'] == true) {
          Fluttertoast.showToast(
            msg:
                'Login Date : ${DateTime.now().day}:${DateTime.now().month}:${DateTime.now().year}',
          );
        }

        if (userData != null && userData['isVerified'] == false) {
          // Run main direct referral logic
          await distributeReferralIncome(
              userId: state.uid, depositId: state.depositId);

          // then verify the user
          await _verifyUser(userRef);

          Fluttertoast.showToast(
            msg: 'Welcome Member Verification Complete',
          );
          state = state.copyWith(isLoading: false);
        }
      }
    } finally {
      // Set loading to false after verification or any errors
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _verifyUser(DocumentReference userRef) async {
    // Perform your verification logic here

    // Update Firestore after verification
    await userRef.update({'isVerified': true});

    // Update the state to reflect that the user is verified
    state = state.copyWith(isVerified: true);
  }
}
