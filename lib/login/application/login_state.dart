import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isUser,
    @Default('') String username,
    @Default('') String tmpPass,
    @Default('') String password,
    @Default(false) bool isUserVerified,
  }) = _LoginState;

  const LoginState._();
}
