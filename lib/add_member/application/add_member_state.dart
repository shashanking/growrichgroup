// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:growrichgroup_dashboard/login/domain/user_model.dart';

part 'add_member_state.freezed.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? newUser,
  }) = _AddMemberState;
  const AddMemberState._();
}
