// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      username: json['username'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      emailId: json['emailId'] as String? ?? '',
      depositId: json['depositId'] as String? ?? '',
      temporaryPassword: json['temporaryPassword'] as String? ?? '123456',
      depositAmount: json['depositAmount'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      pan: json['pan'] as String? ?? '',
      wallet: WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
      referredBy: json['referredBy'] as String? ?? '',
      referredIds: (json['referredIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'emailId': instance.emailId,
      'depositId': instance.depositId,
      'temporaryPassword': instance.temporaryPassword,
      'depositAmount': instance.depositAmount,
      'isVerified': instance.isVerified,
      'isFirstTime': instance.isFirstTime,
      'pan': instance.pan,
      'wallet': instance.wallet.toJson(),
      'referredBy': instance.referredBy,
      'referredIds': instance.referredIds,
    };

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      balance: json['balance'] as num? ?? 0,
      adRevenue: (json['adRevenue'] as num?)?.toDouble() ?? 0.0,
      history: (json['history'] as List<dynamic>?)
              ?.map(
                  (e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) => BalanceStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'adRevenue': instance.adRevenue,
      'history': instance.history,
      'stats': instance.stats,
    };

_$TransactionHistoryImpl _$$TransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryImpl(
      datetime: _dateTimeFromTimestamp(json['datetime'] as Timestamp?),
      transaction: (json['transaction'] as num?)?.toInt() ?? 0,
      transactionStatus: json['transactionStatus'] as String? ?? '',
      transactionType: json['transactionType'] as String? ?? '',
      transactionId: json['transactionId'] as String? ?? '',
    );

Map<String, dynamic> _$$TransactionHistoryImplToJson(
        _$TransactionHistoryImpl instance) =>
    <String, dynamic>{
      'datetime': _dateTimeToTimestamp(instance.datetime),
      'transaction': instance.transaction,
      'transactionStatus': instance.transactionStatus,
      'transactionType': instance.transactionType,
      'transactionId': instance.transactionId,
    };

_$BalanceStatImpl _$$BalanceStatImplFromJson(Map<String, dynamic> json) =>
    _$BalanceStatImpl(
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp?),
      transactionAmount: (json['transactionAmount'] as num?)?.toDouble() ?? 0.0,
      tournamentName: json['tournamentName'] as String? ?? '',
      balanceBefore: (json['balanceBefore'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$BalanceStatImplToJson(_$BalanceStatImpl instance) =>
    <String, dynamic>{
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'transactionAmount': instance.transactionAmount,
      'tournamentName': instance.tournamentName,
      'balanceBefore': instance.balanceBefore,
    };
