// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositModelImpl _$$DepositModelImplFromJson(Map<String, dynamic> json) =>
    _$DepositModelImpl(
      id: json['id'] as String? ?? '',
      depositId: json['depositId'] as String? ?? '',
      depositAmount: json['depositAmount'] as String? ?? '',
      depositorName: json['depositorName'] as String? ?? '',
      topUps: (json['topUps'] as List<dynamic>?)
              ?.map((e) => TopUpModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp?),
      updatedAt: _dateTimeFromTimestamp(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$DepositModelImplToJson(_$DepositModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depositId': instance.depositId,
      'depositAmount': instance.depositAmount,
      'depositorName': instance.depositorName,
      'topUps': instance.topUps?.map((e) => e.toJson()).toList(),
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'updatedAt': _dateTimeToTimestamp(instance.updatedAt),
    };

_$TopUpModelImpl _$$TopUpModelImplFromJson(Map<String, dynamic> json) =>
    _$TopUpModelImpl(
      id: json['id'] as String? ?? '',
      topUpId: json['topUpId'] as String? ?? '',
      topupAmount: json['topupAmount'] as String? ?? '',
      depositorName: json['depositorName'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$TopUpModelImplToJson(_$TopUpModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topUpId': instance.topUpId,
      'topupAmount': instance.topupAmount,
      'depositorName': instance.depositorName,
      'isVerified': instance.isVerified,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
    };
