// ignore_for_file: parameter_assignments, empty_catches

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growrichgroup_dashboard/dashboard/application/dashboard_state.dart';
import 'package:growrichgroup_dashboard/login/domain/deposit_model.dart';
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
      debugPrint('Error fetching referred users: $e');
    }
  }

  Future<int> calculateTeamSum(List<String>? referredByIds) async {
    try {
      if (referredByIds == null || referredByIds.isEmpty) {
        return 0;
      }

      int sum = 0;

      // A queue to handle the while loop traversal
      List<String> queue = List.from(referredByIds);

      while (queue.isNotEmpty) {
        // Get the first element in the queue
        String currentUserId = queue.removeAt(0);

        // Fetch the user associated with currentUserId from the database
        UserModel? user = await fetchUserById(currentUserId);

        if (user != null) {
          // Increment the sum by 1 for the current user
          sum += 1;

          // If the user has referredIds, add them to the queue
          if (user.referredIds != null && user.referredIds!.isNotEmpty) {
            queue.addAll(user.referredIds!);
          }
        }
      }

      return sum;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Future<double> calculateTotalDepositAmount(
      List<String>? referredByIds) async {
    try {
      if (referredByIds == null || referredByIds.isEmpty) {
        return 0.00;
      }

      double totalDepositAmount = 0.00;

      // A queue to handle the while loop traversal
      List<String> queue = List.from(referredByIds);

      while (queue.isNotEmpty) {
        // Get the first element in the queue
        String currentUserId = queue.removeAt(0);

        // Fetch the user associated with currentUserId from the database
        UserModel? user = await fetchUserById(currentUserId);

        if (user != null && user.depositId.isNotEmpty) {
          // Get the last deposit ID
          String lastDepositId = user.depositId.last;

          // Fetch the deposit associated with lastDepositId from the database
          DepositModel? deposit = await fetchDepositById(lastDepositId);

          if (deposit != null) {
            // Add the deposit amount to the total
            totalDepositAmount +=
                double.tryParse(deposit.depositAmount) ?? 0.00;
          }

          // If the user has referredIds, add them to the queue
          if (user.referredIds != null && user.referredIds!.isNotEmpty) {
            queue.addAll(user.referredIds!);
          }
        }
      }

      return totalDepositAmount;
    } catch (e) {
      debugPrint(e.toString());
      return 0.00;
    }
  }

// Assuming you have a function to fetch DepositModel by ID
  Future<DepositModel?> fetchDepositById(String depositId) async {
    return await FirebaseFirestore.instance
        .collection('deposits')
        .doc(depositId)
        .get()
        .then((doc) => doc.exists
            ? DepositModel.fromJson(doc.data() as Map<String, dynamic>)
            : null);
  }

// Assuming you have a function to fetch UserModel by ID
  Future<UserModel?> fetchUserById(String userId) async {
    return await _firestore.collection('users').doc(userId).get().then((doc) =>
        doc.exists
            ? UserModel.fromJson(doc.data() as Map<String, dynamic>)
            : null);
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

          final sumDR = await totalIncome(userFromModel.interests!,
              type: 'direct-referral-income');
          final sumNW = await totalIncome(userFromModel.interests!,
              type: 'non-working-income');
          final sumUL = await totalIncome(userFromModel.interests!,
              type: 'uni-level-income');
          final teamSum = await calculateTeamSum(userFromModel.referredIds);
          final teamDepositSum =
              await calculateTotalDepositAmount(userFromModel.referredIds);

          state = state.copyWith(
            uid: userID,
            depositId: depositIds.last,
            depositAmount: depositAmount,
            user: userFromModel,
            noOfIncome: userFromModel.interests?.length ?? 0,
            totalDRIncome: sumDR,
            totalNWIncome: sumNW,
            totalULIncome: sumUL,
            teamSum: teamSum,
            teamIncome: teamDepositSum,
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

  Future<double> totalIncome(List<IncomeModel>? incomes, {String? type}) async {
    if (incomes == null || incomes.isEmpty) {
      return 0.00;
    }

    double total = 0.00;

    for (var income in incomes) {
      if (type == null || income.incomeType == type) {
        total += double.tryParse(income.incomeAmount) ?? 0.00;
      }
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
              await addInterestToUser(
                  userId: referredUserDoc.id,
                  interestAmount: interestAmount,
                  depositId: depositId,
                  incomeFromUser: incomeFromUser,
                  type: 'direct-referral-income');
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

  Future<void> triggerBiWeeklyInterest() async {
    try {
      state = state.copyWith(isLoading: true);

      // Fetch all deposit documents from the 'deposits' collection
      QuerySnapshot depositDocs = await _firestore.collection('deposits').get();

      if (depositDocs.docs.isEmpty) {
        debugPrint('No deposits found for bi-weekly interest calculation.');
        state = state.copyWith(isLoading: false);
        return;
      }

      for (var depositDoc in depositDocs.docs) {
        try {
          // Extract deposit details
          String depositId = depositDoc['depositId'];
          String depositorId = depositDoc['id'];
          double depositAmount = double.parse(depositDoc['depositAmount']);

          // Ensure depositAmount is valid
          if (depositAmount <= 0) {
            debugPrint('Invalid deposit amount for depositId: $depositId');
            continue;
          }

          // Calculate non-working income (5% of deposit amount)
          double nonWorkingIncome = depositAmount * 0.05;

          // Fetch the user document associated with the depositor
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(depositorId).get();

          if (userDoc.exists) {
            // Add non-working income to the user's interests
            await addInterestToUser(
              userId: depositorId,
              interestAmount: nonWorkingIncome,
              depositId: depositId,
              incomeFromUser: '',
              type: 'non-working-income',
            );

            // Distribute Uni-level income based on the non-working income
            await distributeUnilevelIncome(
              userId: depositorId,
              incomeAmount: nonWorkingIncome,
              depositId: depositId,
            );
          } else {
            debugPrint('User document not found for depositorId: $depositorId');
          }
        } catch (e) {
          debugPrint(
              'Error processing depositId: ${depositDoc['depositId']}, Error: $e');
        }
      }
    } catch (e) {
      debugPrint('Error triggering bi-weekly interest: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> distributeUnilevelIncome({
    required String userId,
    required double incomeAmount,
    required String depositId,
  }) async {
    try {
      // Fetch the user document by userId
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (!userDoc.exists) {
        debugPrint('User document not found for ID: $userId');
        return;
      }

      String? referredById = userDoc['referredBy'];
      int level = 1;

      // Start the level-wise distribution of Uni-level interest
      while (referredById != null && level <= 20) {
        try {
          // Fetch the referred user's document
          DocumentSnapshot referredUserDoc =
              await _firestore.collection('users').doc(referredById).get();

          if (!referredUserDoc.exists) {
            debugPrint(
                'Referred user document not found for ID: $referredById');
            break;
          }

          List<String> referralIds =
              (referredUserDoc['referredIds'] as List<dynamic>)
                  .map((e) => e as String)
                  .toList();

          // Check if the referred user meets the direct referrals condition for this level
          if (meetsDirectReferralCondition(level, referralIds.length)) {
            double interestPercentage = getUnilevelInterestPercentage(level);
            double interestAmount = incomeAmount * interestPercentage / 100;

            // Add the Uni-level interest to the referred user's document
            await addInterestToUser(
                userId: referredUserDoc.id,
                interestAmount: interestAmount,
                depositId: depositId,
                incomeFromUser: userId,
                type: 'uni-level-income');
          }

          // Move to the next level
          referredById =
              referredUserDoc['referredBy']; // Get the next referredBy ID
          level++;
        } catch (e) {
          debugPrint(
              'Error distributing Uni-level income at level $level for userId: $userId, Error: $e');
          break;
        }
      }
    } catch (e) {
      debugPrint('Error distributing Uni-level income: $e');
    }
  }

  double getUnilevelInterestPercentage(int level) {
    if (level == 1) {
      return 15.0;
    } else if (level == 2) {
      return 12.0;
    } else if (level >= 3 && level <= 10) {
      return 5.0;
    } else if (level >= 11 && level <= 20) {
      return 3.0;
    } else {
      return 0.0; // No interest for levels beyond 20
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

  Future<void> addInterestToUser(
      {required String userId,
      required double interestAmount,
      required String depositId,
      required String incomeFromUser,
      required String type}) async {
    await _firestore.collection('users').doc(userId).update({
      'interests': FieldValue.arrayUnion([
        IncomeModel(
          incomeId: generateDirectReferralIncomeId(),
          depositId: depositId,
          incomeFromUser: incomeFromUser,
          incomeAmount: interestAmount.toString(),
          incomeType: type,
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

  Future<Map<String, dynamic>> checkUserGlobalLevel() async {
    try {
      // Fetch the user document
      final uid = extractEmailPrefix(_auth.currentUser?.email ?? '');
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        List<String> referredIds =
            List<String>.from(userDoc['referredIds'] ?? []);

        if (referredIds.isEmpty) {
          return {
            'level': 'None',
            'nextLevel': 'Silver',
            'amountNeeded': 1000000 // 10 lakh
          };
        }

        // Fetch the deposits of all referred users
        List<DocumentSnapshot> depositDocs = [];
        for (String referredId in referredIds) {
          QuerySnapshot depositQuery = await _firestore
              .collection('deposits')
              .where('id', isEqualTo: referredId)
              .get();
          depositDocs.addAll(depositQuery.docs);
        }

        double totalDeposit = 0;
        double maxSingleDeposit = 0;

        // Calculate total deposits and find the max single deposit
        for (var depositDoc in depositDocs) {
          double depositAmount = double.parse(depositDoc['depositAmount']);
          totalDeposit += depositAmount;
          if (depositAmount > maxSingleDeposit) {
            maxSingleDeposit = depositAmount;
          }
        }

        // Check qualification for different levels
        String currentLevel = 'None';
        String nextLevel = 'Silver';
        double amountNeeded = 1000000 - totalDeposit;

        if (totalDeposit >= 1000000 && maxSingleDeposit >= totalDeposit * 0.4) {
          currentLevel = 'Silver';
          nextLevel = 'Gold';
          amountNeeded = 2500000 - totalDeposit;
        }

        if (totalDeposit >= 2500000 && maxSingleDeposit >= totalDeposit * 0.4) {
          currentLevel = 'Gold';
          nextLevel = 'Platinum';
          amountNeeded = 5000000 - totalDeposit;
        }

        if (totalDeposit >= 5000000 && maxSingleDeposit >= totalDeposit * 0.4) {
          currentLevel = 'Platinum';
          nextLevel = 'Diamond';
          amountNeeded = 10000000 - totalDeposit;
        }

        if (totalDeposit >= 10000000 &&
            maxSingleDeposit >= totalDeposit * 0.4) {
          currentLevel = 'Diamond';
          nextLevel = 'None';
          amountNeeded = 0;
        }

        return {
          'level': currentLevel,
          'nextLevel': nextLevel,
          'amountNeeded': amountNeeded
        };
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      debugPrint('Error checking user level: $e');
      return {'level': 'Error', 'nextLevel': '', 'amountNeeded': 0};
    }
  }

  Future<List<UserModel>> fetchReferredUsersById(String userId) async {
    try {
      final List<UserModel> referredUsersList = [];

      // Fetch the referred user's document from Firestore based on userId
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        final List<String> referredIds =
            List<String>.from(userDoc.data()?['referredIds'] ?? []);

        // Fetch all the referred users based on referredIds
        for (String referredId in referredIds) {
          final referredUserDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(referredId)
              .get();
          if (referredUserDoc.exists) {
            referredUsersList.add(UserModel.fromJson(
                referredUserDoc.data() as Map<String, dynamic>));
          }
        }
      }
      return referredUsersList;
    } catch (e) {
      // Handle any errors that occur during the fetch
      throw Exception('Error fetching referred users: $e');
    }
  }
}
