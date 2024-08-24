// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../login/domain/user_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? user,
    @Default(false) bool isVerified,
    @Default('') String uid,
    @Default('') String depositId,
    @Default('') String depositAmount,
    @Default([]) List<UserModel> referredUsersList,
    @Default(0.0) double totalIncome,
    @Default(0) int noOfIncome,
    @Default('') String levelAccess,
  }) = _DashboardState;
  const DashboardState._();
}
