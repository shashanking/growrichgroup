// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddMemberState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddMemberStateCopyWith<AddMemberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMemberStateCopyWith<$Res> {
  factory $AddMemberStateCopyWith(
          AddMemberState value, $Res Function(AddMemberState) then) =
      _$AddMemberStateCopyWithImpl<$Res, AddMemberState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AddMemberStateCopyWithImpl<$Res, $Val extends AddMemberState>
    implements $AddMemberStateCopyWith<$Res> {
  _$AddMemberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMemberStateImplCopyWith<$Res>
    implements $AddMemberStateCopyWith<$Res> {
  factory _$$AddMemberStateImplCopyWith(_$AddMemberStateImpl value,
          $Res Function(_$AddMemberStateImpl) then) =
      __$$AddMemberStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AddMemberStateImplCopyWithImpl<$Res>
    extends _$AddMemberStateCopyWithImpl<$Res, _$AddMemberStateImpl>
    implements _$$AddMemberStateImplCopyWith<$Res> {
  __$$AddMemberStateImplCopyWithImpl(
      _$AddMemberStateImpl _value, $Res Function(_$AddMemberStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AddMemberStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddMemberStateImpl extends _AddMemberState {
  const _$AddMemberStateImpl({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddMemberState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMemberStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMemberStateImplCopyWith<_$AddMemberStateImpl> get copyWith =>
      __$$AddMemberStateImplCopyWithImpl<_$AddMemberStateImpl>(
          this, _$identity);
}

abstract class _AddMemberState extends AddMemberState {
  const factory _AddMemberState({final bool isLoading}) = _$AddMemberStateImpl;
  const _AddMemberState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AddMemberStateImplCopyWith<_$AddMemberStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
