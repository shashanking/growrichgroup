import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_state.freezed.dart';

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    @Default(false) bool isLoading,
  }) = _DepositState;

  const DepositState._();
}
