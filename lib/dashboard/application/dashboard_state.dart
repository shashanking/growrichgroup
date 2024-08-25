// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../login/domain/user_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default(null) UserModel? user,
    @Default(null) UserModel? selectedMember,
    @Default(false) bool isVerified,
    @Default('') String uid,
    @Default('') String depositId,
    @Default('') String depositAmount,
    @Default([]) List<UserModel> referredUsersList,
    @Default([]) List<UserModel> kReferredUsersList,
    @Default(0.0) double totalDRIncome,
    @Default(0.0) double totalNWIncome,
    @Default(0.0) double totalULIncome,
    @Default(0.0) double teamIncome,
    @Default(0) int noOfIncome,
    @Default(0) int teamSum,
    @Default('') String levelAccess,
    @Default('') String depositMap,
  }) = _DashboardState;
  const DashboardState._();
}
