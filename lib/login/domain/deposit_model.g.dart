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
      createdAt: _dateTimeFromTimestamp(json['createdAt'] as Timestamp?),
      updatedAt: _dateTimeFromTimestamp(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$DepositModelImplToJson(_$DepositModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depositId': instance.depositId,
      'depositAmount': instance.depositAmount,
      'depositorName': instance.depositorName,
      'createdAt': _dateTimeToTimestamp(instance.createdAt),
      'updatedAt': _dateTimeToTimestamp(instance.updatedAt),
    };
