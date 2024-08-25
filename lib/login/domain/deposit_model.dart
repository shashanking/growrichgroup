import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_model.freezed.dart';
part 'deposit_model.g.dart';

@freezed
class DepositModel with _$DepositModel {
  @JsonSerializable(explicitToJson: true)
  const factory DepositModel({
    @Default('') String id,
    @Default('') String depositId,
    @Default('') String depositAmount,
    @Default('') String depositorName,
    @Default([]) List<TopUpModel>? topUps,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? updatedAt,
  }) = _DepositModel;

  factory DepositModel.fromJson(Map<String, dynamic> json) =>
      _$DepositModelFromJson(json);
}

@freezed
class TopUpModel with _$TopUpModel {
  @JsonSerializable(explicitToJson: true)
  const factory TopUpModel({
    @Default('') String id,
    @Default('') String topUpId,
    @Default('') String topupAmount,
    @Default('') String depositorName,
    @Default(false) bool isVerified,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? createdAt,
  }) = _TopUpModel;

  factory TopUpModel.fromJson(Map<String, dynamic> json) =>
      _$TopUpModelFromJson(json);
}

DateTime? _dateTimeFromTimestamp(Timestamp? timestamp) {
  return timestamp?.toDate();
}

Timestamp? _dateTimeToTimestamp(DateTime? dateTime) {
  return dateTime != null ? Timestamp.fromDate(dateTime) : null;
}
