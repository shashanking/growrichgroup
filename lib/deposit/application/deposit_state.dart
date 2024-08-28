import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

part 'deposit_state.freezed.dart';

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    @Default(false) bool isLoading,
    @Default(false) bool isAdmin,
    @Default('') String uid,
    @Default(null) UserModel? user,
  }) = _DepositState;

  const DepositState._();
}
