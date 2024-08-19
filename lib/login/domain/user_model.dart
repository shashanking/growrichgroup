import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// Create a new user

/// User details required for registering :
/// - Pan card (capital cased)
/// - Phone
/// - Email
/// - Name
/// - List<Interest> (model)
///    a. income id
///    b. interest amount
///    c. interest type ( non-working | direct-referral | uni-level ) nw , dr, ul, gi
///    d. updated_at and created_at timestamp
/// - List<Income> (model)
///    a. income id
///    b. deposit amount
///    c. created_at timestamp
///    d. updated_at timestamp
///    e.
/// - timestamp created_at
/// - timestamp updated_at

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @Default('') String id,
    @Default('') String uid,
    @Default('') String username,
    @Default('') String phoneNumber,
    @Default('') String emailId,
    @Default([]) List<String> depositId,
    @Default('123456') String temporaryPassword,
    @Default(false) bool isVerified,
    @Default(true) bool isFirstTime,
    @Default('') String pan,
    @Default([]) List<IncomeModel> incomes,
    @Default('') String referredBy,
    @Default([]) List<String> referredIds,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class IncomeModel with _$IncomeModel {
  @JsonSerializable(explicitToJson: true)
  factory IncomeModel({
    @Default('') String incomeId,
    @Default('') String depositId,
    @Default('') String incomeType,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? updatedAt,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);
}

@freezed
class WalletModel with _$WalletModel {
  @JsonSerializable()
  const factory WalletModel({
    @Default(0) num balance,
    @Default(0.0) double adRevenue,
    @Default([]) List<TransactionHistory> history,
    @Default([]) List<BalanceStat> stats,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

@freezed
class TransactionHistory with _$TransactionHistory {
  @JsonSerializable()
  const factory TransactionHistory({
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? datetime,
    @Default(0) int transaction,
    @Default('') String transactionStatus,
    @Default('') String transactionType,
    @Default('') String transactionId,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

DateTime? _dateTimeFromTimestamp(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? _dateTimeToTimestamp(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}

@freezed
class BalanceStat with _$BalanceStat {
  @JsonSerializable()
  const factory BalanceStat({
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @Default(0.0) double transactionAmount,
    @Default('') String tournamentName,
    @Default(0.0) double balanceBefore,
  }) = _BalanceStat;

  factory BalanceStat.fromJson(Map<String, dynamic> json) =>
      _$BalanceStatFromJson(json);
}
