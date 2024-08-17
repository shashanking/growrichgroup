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
  }) = _DepositModel;

  factory DepositModel.fromJson(Map<String, dynamic> json) => _$DepositModelFromJson(json);
}
