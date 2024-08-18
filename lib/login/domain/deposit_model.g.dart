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
    );

Map<String, dynamic> _$$DepositModelImplToJson(_$DepositModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depositId': instance.depositId,
      'depositAmount': instance.depositAmount,
      'depositorName': instance.depositorName,
    };
