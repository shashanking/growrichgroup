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
  bool get isAdmin => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  UserModel? get selectedMember => throw _privateConstructorUsedError;
  List<DepositModel> get unverifiedDeposits =>
      throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get depositId => throw _privateConstructorUsedError;
  String get depositAmount => throw _privateConstructorUsedError;
  List<UserModel> get referredUsersList => throw _privateConstructorUsedError;
  List<UserModel> get kReferredUsersList => throw _privateConstructorUsedError;
  double get totalDRIncome => throw _privateConstructorUsedError;
  double get totalNWIncome => throw _privateConstructorUsedError;
  double get totalULIncome => throw _privateConstructorUsedError;
  double get teamIncome => throw _privateConstructorUsedError;
  int get noOfIncome => throw _privateConstructorUsedError;
  int get teamSum => throw _privateConstructorUsedError;
  String get levelAccess => throw _privateConstructorUsedError;
  String get topUpId => throw _privateConstructorUsedError;
  String get depositMap => throw _privateConstructorUsedError;

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
      bool isAdmin,
      UserModel? user,
      UserModel? selectedMember,
      List<DepositModel> unverifiedDeposits,
      bool isVerified,
      String uid,
      String depositId,
      String depositAmount,
      List<UserModel> referredUsersList,
      List<UserModel> kReferredUsersList,
      double totalDRIncome,
      double totalNWIncome,
      double totalULIncome,
      double teamIncome,
      int noOfIncome,
      int teamSum,
      String levelAccess,
      String topUpId,
      String depositMap});

  $UserModelCopyWith<$Res>? get user;
  $UserModelCopyWith<$Res>? get selectedMember;
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
    Object? isAdmin = null,
    Object? user = freezed,
    Object? selectedMember = freezed,
    Object? unverifiedDeposits = null,
    Object? isVerified = null,
    Object? uid = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? referredUsersList = null,
    Object? kReferredUsersList = null,
    Object? totalDRIncome = null,
    Object? totalNWIncome = null,
    Object? totalULIncome = null,
    Object? teamIncome = null,
    Object? noOfIncome = null,
    Object? teamSum = null,
    Object? levelAccess = null,
    Object? topUpId = null,
    Object? depositMap = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      selectedMember: freezed == selectedMember
          ? _value.selectedMember
          : selectedMember // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      unverifiedDeposits: null == unverifiedDeposits
          ? _value.unverifiedDeposits
          : unverifiedDeposits // ignore: cast_nullable_to_non_nullable
              as List<DepositModel>,
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
      kReferredUsersList: null == kReferredUsersList
          ? _value.kReferredUsersList
          : kReferredUsersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalDRIncome: null == totalDRIncome
          ? _value.totalDRIncome
          : totalDRIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalNWIncome: null == totalNWIncome
          ? _value.totalNWIncome
          : totalNWIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalULIncome: null == totalULIncome
          ? _value.totalULIncome
          : totalULIncome // ignore: cast_nullable_to_non_nullable
              as double,
      teamIncome: null == teamIncome
          ? _value.teamIncome
          : teamIncome // ignore: cast_nullable_to_non_nullable
              as double,
      noOfIncome: null == noOfIncome
          ? _value.noOfIncome
          : noOfIncome // ignore: cast_nullable_to_non_nullable
              as int,
      teamSum: null == teamSum
          ? _value.teamSum
          : teamSum // ignore: cast_nullable_to_non_nullable
              as int,
      levelAccess: null == levelAccess
          ? _value.levelAccess
          : levelAccess // ignore: cast_nullable_to_non_nullable
              as String,
      topUpId: null == topUpId
          ? _value.topUpId
          : topUpId // ignore: cast_nullable_to_non_nullable
              as String,
      depositMap: null == depositMap
          ? _value.depositMap
          : depositMap // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get selectedMember {
    if (_value.selectedMember == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.selectedMember!, (value) {
      return _then(_value.copyWith(selectedMember: value) as $Val);
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
      bool isAdmin,
      UserModel? user,
      UserModel? selectedMember,
      List<DepositModel> unverifiedDeposits,
      bool isVerified,
      String uid,
      String depositId,
      String depositAmount,
      List<UserModel> referredUsersList,
      List<UserModel> kReferredUsersList,
      double totalDRIncome,
      double totalNWIncome,
      double totalULIncome,
      double teamIncome,
      int noOfIncome,
      int teamSum,
      String levelAccess,
      String topUpId,
      String depositMap});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $UserModelCopyWith<$Res>? get selectedMember;
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
    Object? isAdmin = null,
    Object? user = freezed,
    Object? selectedMember = freezed,
    Object? unverifiedDeposits = null,
    Object? isVerified = null,
    Object? uid = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? referredUsersList = null,
    Object? kReferredUsersList = null,
    Object? totalDRIncome = null,
    Object? totalNWIncome = null,
    Object? totalULIncome = null,
    Object? teamIncome = null,
    Object? noOfIncome = null,
    Object? teamSum = null,
    Object? levelAccess = null,
    Object? topUpId = null,
    Object? depositMap = null,
  }) {
    return _then(_$DashboardStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      selectedMember: freezed == selectedMember
          ? _value.selectedMember
          : selectedMember // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      unverifiedDeposits: null == unverifiedDeposits
          ? _value._unverifiedDeposits
          : unverifiedDeposits // ignore: cast_nullable_to_non_nullable
              as List<DepositModel>,
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
      kReferredUsersList: null == kReferredUsersList
          ? _value._kReferredUsersList
          : kReferredUsersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalDRIncome: null == totalDRIncome
          ? _value.totalDRIncome
          : totalDRIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalNWIncome: null == totalNWIncome
          ? _value.totalNWIncome
          : totalNWIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalULIncome: null == totalULIncome
          ? _value.totalULIncome
          : totalULIncome // ignore: cast_nullable_to_non_nullable
              as double,
      teamIncome: null == teamIncome
          ? _value.teamIncome
          : teamIncome // ignore: cast_nullable_to_non_nullable
              as double,
      noOfIncome: null == noOfIncome
          ? _value.noOfIncome
          : noOfIncome // ignore: cast_nullable_to_non_nullable
              as int,
      teamSum: null == teamSum
          ? _value.teamSum
          : teamSum // ignore: cast_nullable_to_non_nullable
              as int,
      levelAccess: null == levelAccess
          ? _value.levelAccess
          : levelAccess // ignore: cast_nullable_to_non_nullable
              as String,
      topUpId: null == topUpId
          ? _value.topUpId
          : topUpId // ignore: cast_nullable_to_non_nullable
              as String,
      depositMap: null == depositMap
          ? _value.depositMap
          : depositMap // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl extends _DashboardState {
  const _$DashboardStateImpl(
      {this.isLoading = false,
      this.isAdmin = false,
      this.user = null,
      this.selectedMember = null,
      final List<DepositModel> unverifiedDeposits = const [],
      this.isVerified = false,
      this.uid = '',
      this.depositId = '',
      this.depositAmount = '',
      final List<UserModel> referredUsersList = const [],
      final List<UserModel> kReferredUsersList = const [],
      this.totalDRIncome = 0.0,
      this.totalNWIncome = 0.0,
      this.totalULIncome = 0.0,
      this.teamIncome = 0.0,
      this.noOfIncome = 0,
      this.teamSum = 0,
      this.levelAccess = '',
      this.topUpId = '',
      this.depositMap = ''})
      : _unverifiedDeposits = unverifiedDeposits,
        _referredUsersList = referredUsersList,
        _kReferredUsersList = kReferredUsersList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final UserModel? user;
  @override
  @JsonKey()
  final UserModel? selectedMember;
  final List<DepositModel> _unverifiedDeposits;
  @override
  @JsonKey()
  List<DepositModel> get unverifiedDeposits {
    if (_unverifiedDeposits is EqualUnmodifiableListView)
      return _unverifiedDeposits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unverifiedDeposits);
  }

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

  final List<UserModel> _kReferredUsersList;
  @override
  @JsonKey()
  List<UserModel> get kReferredUsersList {
    if (_kReferredUsersList is EqualUnmodifiableListView)
      return _kReferredUsersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kReferredUsersList);
  }

  @override
  @JsonKey()
  final double totalDRIncome;
  @override
  @JsonKey()
  final double totalNWIncome;
  @override
  @JsonKey()
  final double totalULIncome;
  @override
  @JsonKey()
  final double teamIncome;
  @override
  @JsonKey()
  final int noOfIncome;
  @override
  @JsonKey()
  final int teamSum;
  @override
  @JsonKey()
  final String levelAccess;
  @override
  @JsonKey()
  final String topUpId;
  @override
  @JsonKey()
  final String depositMap;

  @override
  String toString() {
    return 'DashboardState(isLoading: $isLoading, isAdmin: $isAdmin, user: $user, selectedMember: $selectedMember, unverifiedDeposits: $unverifiedDeposits, isVerified: $isVerified, uid: $uid, depositId: $depositId, depositAmount: $depositAmount, referredUsersList: $referredUsersList, kReferredUsersList: $kReferredUsersList, totalDRIncome: $totalDRIncome, totalNWIncome: $totalNWIncome, totalULIncome: $totalULIncome, teamIncome: $teamIncome, noOfIncome: $noOfIncome, teamSum: $teamSum, levelAccess: $levelAccess, topUpId: $topUpId, depositMap: $depositMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedMember, selectedMember) ||
                other.selectedMember == selectedMember) &&
            const DeepCollectionEquality()
                .equals(other._unverifiedDeposits, _unverifiedDeposits) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            const DeepCollectionEquality()
                .equals(other._referredUsersList, _referredUsersList) &&
            const DeepCollectionEquality()
                .equals(other._kReferredUsersList, _kReferredUsersList) &&
            (identical(other.totalDRIncome, totalDRIncome) ||
                other.totalDRIncome == totalDRIncome) &&
            (identical(other.totalNWIncome, totalNWIncome) ||
                other.totalNWIncome == totalNWIncome) &&
            (identical(other.totalULIncome, totalULIncome) ||
                other.totalULIncome == totalULIncome) &&
            (identical(other.teamIncome, teamIncome) ||
                other.teamIncome == teamIncome) &&
            (identical(other.noOfIncome, noOfIncome) ||
                other.noOfIncome == noOfIncome) &&
            (identical(other.teamSum, teamSum) || other.teamSum == teamSum) &&
            (identical(other.levelAccess, levelAccess) ||
                other.levelAccess == levelAccess) &&
            (identical(other.topUpId, topUpId) || other.topUpId == topUpId) &&
            (identical(other.depositMap, depositMap) ||
                other.depositMap == depositMap));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isAdmin,
        user,
        selectedMember,
        const DeepCollectionEquality().hash(_unverifiedDeposits),
        isVerified,
        uid,
        depositId,
        depositAmount,
        const DeepCollectionEquality().hash(_referredUsersList),
        const DeepCollectionEquality().hash(_kReferredUsersList),
        totalDRIncome,
        totalNWIncome,
        totalULIncome,
        teamIncome,
        noOfIncome,
        teamSum,
        levelAccess,
        topUpId,
        depositMap
      ]);

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
      final bool isAdmin,
      final UserModel? user,
      final UserModel? selectedMember,
      final List<DepositModel> unverifiedDeposits,
      final bool isVerified,
      final String uid,
      final String depositId,
      final String depositAmount,
      final List<UserModel> referredUsersList,
      final List<UserModel> kReferredUsersList,
      final double totalDRIncome,
      final double totalNWIncome,
      final double totalULIncome,
      final double teamIncome,
      final int noOfIncome,
      final int teamSum,
      final String levelAccess,
      final String topUpId,
      final String depositMap}) = _$DashboardStateImpl;
  const _DashboardState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isAdmin;
  @override
  UserModel? get user;
  @override
  UserModel? get selectedMember;
  @override
  List<DepositModel> get unverifiedDeposits;
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
  List<UserModel> get kReferredUsersList;
  @override
  double get totalDRIncome;
  @override
  double get totalNWIncome;
  @override
  double get totalULIncome;
  @override
  double get teamIncome;
  @override
  int get noOfIncome;
  @override
  int get teamSum;
  @override
  String get levelAccess;
  @override
  String get topUpId;
  @override
  String get depositMap;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
