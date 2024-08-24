// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get depositId => throw _privateConstructorUsedError;
  String get depositAmount => throw _privateConstructorUsedError;
  List<UserModel> get referredUsersList => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  int get noOfIncome => throw _privateConstructorUsedError;
  String get levelAccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? user,
      bool isVerified,
      String uid,
      String depositId,
      String depositAmount,
      List<UserModel> referredUsersList,
      double totalIncome,
      int noOfIncome,
      String levelAccess});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
    Object? isVerified = null,
    Object? uid = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? referredUsersList = null,
    Object? totalIncome = null,
    Object? noOfIncome = null,
    Object? levelAccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      referredUsersList: null == referredUsersList
          ? _value.referredUsersList
          : referredUsersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      noOfIncome: null == noOfIncome
          ? _value.noOfIncome
          : noOfIncome // ignore: cast_nullable_to_non_nullable
              as int,
      levelAccess: null == levelAccess
          ? _value.levelAccess
          : levelAccess // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      UserModel? user,
      bool isVerified,
      String uid,
      String depositId,
      String depositAmount,
      List<UserModel> referredUsersList,
      double totalIncome,
      int noOfIncome,
      String levelAccess});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? user = freezed,
    Object? isVerified = null,
    Object? uid = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? referredUsersList = null,
    Object? totalIncome = null,
    Object? noOfIncome = null,
    Object? levelAccess = null,
  }) {
    return _then(_$DashboardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      referredUsersList: null == referredUsersList
          ? _value._referredUsersList
          : referredUsersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      noOfIncome: null == noOfIncome
          ? _value.noOfIncome
          : noOfIncome // ignore: cast_nullable_to_non_nullable
              as int,
      levelAccess: null == levelAccess
          ? _value.levelAccess
          : levelAccess // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl extends _DashboardState {
  const _$DashboardStateImpl(
      {this.isLoading = false,
      this.user = null,
      this.isVerified = false,
      this.uid = '',
      this.depositId = '',
      this.depositAmount = '',
      final List<UserModel> referredUsersList = const [],
      this.totalIncome = 0.0,
      this.noOfIncome = 0,
      this.levelAccess = ''})
      : _referredUsersList = referredUsersList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final UserModel? user;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String depositId;
  @override
  @JsonKey()
  final String depositAmount;
  final List<UserModel> _referredUsersList;
  @override
  @JsonKey()
  List<UserModel> get referredUsersList {
    if (_referredUsersList is EqualUnmodifiableListView)
      return _referredUsersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referredUsersList);
  }

  @override
  @JsonKey()
  final double totalIncome;
  @override
  @JsonKey()
  final int noOfIncome;
  @override
  @JsonKey()
  final String levelAccess;

  @override
  String toString() {
    return 'DashboardState(isLoading: $isLoading, user: $user, isVerified: $isVerified, uid: $uid, depositId: $depositId, depositAmount: $depositAmount, referredUsersList: $referredUsersList, totalIncome: $totalIncome, noOfIncome: $noOfIncome, levelAccess: $levelAccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            const DeepCollectionEquality()
                .equals(other._referredUsersList, _referredUsersList) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.noOfIncome, noOfIncome) ||
                other.noOfIncome == noOfIncome) &&
            (identical(other.levelAccess, levelAccess) ||
                other.levelAccess == levelAccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      user,
      isVerified,
      uid,
      depositId,
      depositAmount,
      const DeepCollectionEquality().hash(_referredUsersList),
      totalIncome,
      noOfIncome,
      levelAccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState extends DashboardState {
  const factory _DashboardState(
      {final bool isLoading,
      final UserModel? user,
      final bool isVerified,
      final String uid,
      final String depositId,
      final String depositAmount,
      final List<UserModel> referredUsersList,
      final double totalIncome,
      final int noOfIncome,
      final String levelAccess}) = _$DashboardStateImpl;
  const _DashboardState._() : super._();

  @override
  bool get isLoading;
  @override
  UserModel? get user;
  @override
  bool get isVerified;
  @override
  String get uid;
  @override
  String get depositId;
  @override
  String get depositAmount;
  @override
  List<UserModel> get referredUsersList;
  @override
  double get totalIncome;
  @override
  int get noOfIncome;
  @override
  String get levelAccess;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
