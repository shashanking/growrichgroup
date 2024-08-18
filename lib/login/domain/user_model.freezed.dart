// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get emailId => throw _privateConstructorUsedError;
  String get depositId => throw _privateConstructorUsedError;
  String get temporaryPassword => throw _privateConstructorUsedError;
  String get depositAmount => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isFirstTime => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  WalletModel get wallet => throw _privateConstructorUsedError;
  String get referredBy => throw _privateConstructorUsedError;
  List<String> get referredIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String uid,
      String username,
      String phoneNumber,
      String emailId,
      String depositId,
      String temporaryPassword,
      String depositAmount,
      bool isVerified,
      bool isFirstTime,
      String? pan,
      WalletModel wallet,
      String referredBy,
      List<String> referredIds});

  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? emailId = null,
    Object? depositId = null,
    Object? temporaryPassword = null,
    Object? depositAmount = null,
    Object? isVerified = null,
    Object? isFirstTime = null,
    Object? pan = freezed,
    Object? wallet = null,
    Object? referredBy = null,
    Object? referredIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryPassword: null == temporaryPassword
          ? _value.temporaryPassword
          : temporaryPassword // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstTime: null == isFirstTime
          ? _value.isFirstTime
          : isFirstTime // ignore: cast_nullable_to_non_nullable
              as bool,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      referredIds: null == referredIds
          ? _value.referredIds
          : referredIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res> get wallet {
    return $WalletModelCopyWith<$Res>(_value.wallet, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String uid,
      String username,
      String phoneNumber,
      String emailId,
      String depositId,
      String temporaryPassword,
      String depositAmount,
      bool isVerified,
      bool isFirstTime,
      String? pan,
      WalletModel wallet,
      String referredBy,
      List<String> referredIds});

  @override
  $WalletModelCopyWith<$Res> get wallet;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? emailId = null,
    Object? depositId = null,
    Object? temporaryPassword = null,
    Object? depositAmount = null,
    Object? isVerified = null,
    Object? isFirstTime = null,
    Object? pan = freezed,
    Object? wallet = null,
    Object? referredBy = null,
    Object? referredIds = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryPassword: null == temporaryPassword
          ? _value.temporaryPassword
          : temporaryPassword // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstTime: null == isFirstTime
          ? _value.isFirstTime
          : isFirstTime // ignore: cast_nullable_to_non_nullable
              as bool,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel,
      referredBy: null == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String,
      referredIds: null == referredIds
          ? _value._referredIds
          : referredIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {this.id = '',
      this.uid = '',
      this.username = '',
      this.phoneNumber = '',
      this.emailId = '',
      this.depositId = '',
      this.temporaryPassword = '123456',
      this.depositAmount = '',
      this.isVerified = false,
      this.isFirstTime = true,
      this.pan = '',
      required this.wallet,
      this.referredBy = '',
      final List<String> referredIds = const []})
      : _referredIds = referredIds;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String emailId;
  @override
  @JsonKey()
  final String depositId;
  @override
  @JsonKey()
  final String temporaryPassword;
  @override
  @JsonKey()
  final String depositAmount;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isFirstTime;
  @override
  @JsonKey()
  final String? pan;
  @override
  final WalletModel wallet;
  @override
  @JsonKey()
  final String referredBy;
  final List<String> _referredIds;
  @override
  @JsonKey()
  List<String> get referredIds {
    if (_referredIds is EqualUnmodifiableListView) return _referredIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referredIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, uid: $uid, username: $username, phoneNumber: $phoneNumber, emailId: $emailId, depositId: $depositId, temporaryPassword: $temporaryPassword, depositAmount: $depositAmount, isVerified: $isVerified, isFirstTime: $isFirstTime, pan: $pan, wallet: $wallet, referredBy: $referredBy, referredIds: $referredIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('emailId', emailId))
      ..add(DiagnosticsProperty('depositId', depositId))
      ..add(DiagnosticsProperty('temporaryPassword', temporaryPassword))
      ..add(DiagnosticsProperty('depositAmount', depositAmount))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('isFirstTime', isFirstTime))
      ..add(DiagnosticsProperty('pan', pan))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('referredBy', referredBy))
      ..add(DiagnosticsProperty('referredIds', referredIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.temporaryPassword, temporaryPassword) ||
                other.temporaryPassword == temporaryPassword) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isFirstTime, isFirstTime) ||
                other.isFirstTime == isFirstTime) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            const DeepCollectionEquality()
                .equals(other._referredIds, _referredIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      username,
      phoneNumber,
      emailId,
      depositId,
      temporaryPassword,
      depositAmount,
      isVerified,
      isFirstTime,
      pan,
      wallet,
      referredBy,
      const DeepCollectionEquality().hash(_referredIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String id,
      final String uid,
      final String username,
      final String phoneNumber,
      final String emailId,
      final String depositId,
      final String temporaryPassword,
      final String depositAmount,
      final bool isVerified,
      final bool isFirstTime,
      final String? pan,
      required final WalletModel wallet,
      final String referredBy,
      final List<String> referredIds}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  String get username;
  @override
  String get phoneNumber;
  @override
  String get emailId;
  @override
  String get depositId;
  @override
  String get temporaryPassword;
  @override
  String get depositAmount;
  @override
  bool get isVerified;
  @override
  bool get isFirstTime;
  @override
  String? get pan;
  @override
  WalletModel get wallet;
  @override
  String get referredBy;
  @override
  List<String> get referredIds;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  num get balance => throw _privateConstructorUsedError;
  double get adRevenue => throw _privateConstructorUsedError;
  List<TransactionHistory> get history => throw _privateConstructorUsedError;
  List<BalanceStat> get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {num balance,
      double adRevenue,
      List<TransactionHistory> history,
      List<BalanceStat> stats});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? adRevenue = null,
    Object? history = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      adRevenue: null == adRevenue
          ? _value.adRevenue
          : adRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<BalanceStat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num balance,
      double adRevenue,
      List<TransactionHistory> history,
      List<BalanceStat> stats});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? adRevenue = null,
    Object? history = null,
    Object? stats = null,
  }) {
    return _then(_$WalletModelImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      adRevenue: null == adRevenue
          ? _value.adRevenue
          : adRevenue // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<BalanceStat>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$WalletModelImpl with DiagnosticableTreeMixin implements _WalletModel {
  const _$WalletModelImpl(
      {this.balance = 0,
      this.adRevenue = 0.0,
      final List<TransactionHistory> history = const [],
      final List<BalanceStat> stats = const []})
      : _history = history,
        _stats = stats;

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  @JsonKey()
  final num balance;
  @override
  @JsonKey()
  final double adRevenue;
  final List<TransactionHistory> _history;
  @override
  @JsonKey()
  List<TransactionHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  final List<BalanceStat> _stats;
  @override
  @JsonKey()
  List<BalanceStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletModel(balance: $balance, adRevenue: $adRevenue, history: $history, stats: $stats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletModel'))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('adRevenue', adRevenue))
      ..add(DiagnosticsProperty('history', history))
      ..add(DiagnosticsProperty('stats', stats));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.adRevenue, adRevenue) ||
                other.adRevenue == adRevenue) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality().equals(other._stats, _stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      balance,
      adRevenue,
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_stats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {final num balance,
      final double adRevenue,
      final List<TransactionHistory> history,
      final List<BalanceStat> stats}) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  num get balance;
  @override
  double get adRevenue;
  @override
  List<TransactionHistory> get history;
  @override
  List<BalanceStat> get stats;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get datetime => throw _privateConstructorUsedError;
  int get transaction => throw _privateConstructorUsedError;
  String get transactionStatus => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datetime,
      int transaction,
      String transactionStatus,
      String transactionType,
      String transactionId});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? transaction = null,
    Object? transactionStatus = null,
    Object? transactionType = null,
    Object? transactionId = null,
  }) {
    return _then(_value.copyWith(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionHistoryImplCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$TransactionHistoryImplCopyWith(_$TransactionHistoryImpl value,
          $Res Function(_$TransactionHistoryImpl) then) =
      __$$TransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datetime,
      int transaction,
      String transactionStatus,
      String transactionType,
      String transactionId});
}

/// @nodoc
class __$$TransactionHistoryImplCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$TransactionHistoryImpl>
    implements _$$TransactionHistoryImplCopyWith<$Res> {
  __$$TransactionHistoryImplCopyWithImpl(_$TransactionHistoryImpl _value,
      $Res Function(_$TransactionHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = freezed,
    Object? transaction = null,
    Object? transactionStatus = null,
    Object? transactionType = null,
    Object? transactionId = null,
  }) {
    return _then(_$TransactionHistoryImpl(
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$TransactionHistoryImpl
    with DiagnosticableTreeMixin
    implements _TransactionHistory {
  const _$TransactionHistoryImpl(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.datetime,
      this.transaction = 0,
      this.transactionStatus = '',
      this.transactionType = '',
      this.transactionId = ''});

  factory _$TransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryImplFromJson(json);

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? datetime;
  @override
  @JsonKey()
  final int transaction;
  @override
  @JsonKey()
  final String transactionStatus;
  @override
  @JsonKey()
  final String transactionType;
  @override
  @JsonKey()
  final String transactionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionHistory(datetime: $datetime, transaction: $transaction, transactionStatus: $transactionStatus, transactionType: $transactionType, transactionId: $transactionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionHistory'))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('transaction', transaction))
      ..add(DiagnosticsProperty('transactionStatus', transactionStatus))
      ..add(DiagnosticsProperty('transactionType', transactionType))
      ..add(DiagnosticsProperty('transactionId', transactionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, datetime, transaction,
      transactionStatus, transactionType, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      __$$TransactionHistoryImplCopyWithImpl<_$TransactionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? datetime,
      final int transaction,
      final String transactionStatus,
      final String transactionType,
      final String transactionId}) = _$TransactionHistoryImpl;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryImpl.fromJson;

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get datetime;
  @override
  int get transaction;
  @override
  String get transactionStatus;
  @override
  String get transactionType;
  @override
  String get transactionId;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BalanceStat _$BalanceStatFromJson(Map<String, dynamic> json) {
  return _BalanceStat.fromJson(json);
}

/// @nodoc
mixin _$BalanceStat {
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double get transactionAmount => throw _privateConstructorUsedError;
  String get tournamentName => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceStatCopyWith<BalanceStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceStatCopyWith<$Res> {
  factory $BalanceStatCopyWith(
          BalanceStat value, $Res Function(BalanceStat) then) =
      _$BalanceStatCopyWithImpl<$Res, BalanceStat>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      double transactionAmount,
      String tournamentName,
      double balanceBefore});
}

/// @nodoc
class _$BalanceStatCopyWithImpl<$Res, $Val extends BalanceStat>
    implements $BalanceStatCopyWith<$Res> {
  _$BalanceStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? transactionAmount = null,
    Object? tournamentName = null,
    Object? balanceBefore = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceStatImplCopyWith<$Res>
    implements $BalanceStatCopyWith<$Res> {
  factory _$$BalanceStatImplCopyWith(
          _$BalanceStatImpl value, $Res Function(_$BalanceStatImpl) then) =
      __$$BalanceStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      double transactionAmount,
      String tournamentName,
      double balanceBefore});
}

/// @nodoc
class __$$BalanceStatImplCopyWithImpl<$Res>
    extends _$BalanceStatCopyWithImpl<$Res, _$BalanceStatImpl>
    implements _$$BalanceStatImplCopyWith<$Res> {
  __$$BalanceStatImplCopyWithImpl(
      _$BalanceStatImpl _value, $Res Function(_$BalanceStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? transactionAmount = null,
    Object? tournamentName = null,
    Object? balanceBefore = null,
  }) {
    return _then(_$BalanceStatImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$BalanceStatImpl with DiagnosticableTreeMixin implements _BalanceStat {
  const _$BalanceStatImpl(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.createdAt,
      this.transactionAmount = 0.0,
      this.tournamentName = '',
      this.balanceBefore = 0.0});

  factory _$BalanceStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceStatImplFromJson(json);

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey()
  final double transactionAmount;
  @override
  @JsonKey()
  final String tournamentName;
  @override
  @JsonKey()
  final double balanceBefore;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BalanceStat(createdAt: $createdAt, transactionAmount: $transactionAmount, tournamentName: $tournamentName, balanceBefore: $balanceBefore)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BalanceStat'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('transactionAmount', transactionAmount))
      ..add(DiagnosticsProperty('tournamentName', tournamentName))
      ..add(DiagnosticsProperty('balanceBefore', balanceBefore));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceStatImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.transactionAmount, transactionAmount) ||
                other.transactionAmount == transactionAmount) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, transactionAmount, tournamentName, balanceBefore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceStatImplCopyWith<_$BalanceStatImpl> get copyWith =>
      __$$BalanceStatImplCopyWithImpl<_$BalanceStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceStatImplToJson(
      this,
    );
  }
}

abstract class _BalanceStat implements BalanceStat {
  const factory _BalanceStat(
      {@JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? createdAt,
      final double transactionAmount,
      final String tournamentName,
      final double balanceBefore}) = _$BalanceStatImpl;

  factory _BalanceStat.fromJson(Map<String, dynamic> json) =
      _$BalanceStatImpl.fromJson;

  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  double get transactionAmount;
  @override
  String get tournamentName;
  @override
  double get balanceBefore;
  @override
  @JsonKey(ignore: true)
  _$$BalanceStatImplCopyWith<_$BalanceStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
