// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepositModel _$DepositModelFromJson(Map<String, dynamic> json) {
  return _DepositModel.fromJson(json);
}

/// @nodoc
mixin _$DepositModel {
  String get id => throw _privateConstructorUsedError;
  String get depositId => throw _privateConstructorUsedError;
  String get depositAmount => throw _privateConstructorUsedError;
  String get depositorName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositModelCopyWith<DepositModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositModelCopyWith<$Res> {
  factory $DepositModelCopyWith(
          DepositModel value, $Res Function(DepositModel) then) =
      _$DepositModelCopyWithImpl<$Res, DepositModel>;
  @useResult
  $Res call(
      {String id,
      String depositId,
      String depositAmount,
      String depositorName,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? updatedAt});
}

/// @nodoc
class _$DepositModelCopyWithImpl<$Res, $Val extends DepositModel>
    implements $DepositModelCopyWith<$Res> {
  _$DepositModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? depositorName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      depositorName: null == depositorName
          ? _value.depositorName
          : depositorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepositModelImplCopyWith<$Res>
    implements $DepositModelCopyWith<$Res> {
  factory _$$DepositModelImplCopyWith(
          _$DepositModelImpl value, $Res Function(_$DepositModelImpl) then) =
      __$$DepositModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String depositId,
      String depositAmount,
      String depositorName,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? updatedAt});
}

/// @nodoc
class __$$DepositModelImplCopyWithImpl<$Res>
    extends _$DepositModelCopyWithImpl<$Res, _$DepositModelImpl>
    implements _$$DepositModelImplCopyWith<$Res> {
  __$$DepositModelImplCopyWithImpl(
      _$DepositModelImpl _value, $Res Function(_$DepositModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depositId = null,
    Object? depositAmount = null,
    Object? depositorName = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DepositModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depositId: null == depositId
          ? _value.depositId
          : depositId // ignore: cast_nullable_to_non_nullable
              as String,
      depositAmount: null == depositAmount
          ? _value.depositAmount
          : depositAmount // ignore: cast_nullable_to_non_nullable
              as String,
      depositorName: null == depositorName
          ? _value.depositorName
          : depositorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DepositModelImpl implements _DepositModel {
  const _$DepositModelImpl(
      {this.id = '',
      this.depositId = '',
      this.depositAmount = '',
      this.depositorName = '',
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.updatedAt});

  factory _$DepositModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String depositId;
  @override
  @JsonKey()
  final String depositAmount;
  @override
  @JsonKey()
  final String depositorName;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DepositModel(id: $id, depositId: $depositId, depositAmount: $depositAmount, depositorName: $depositorName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.depositId, depositId) ||
                other.depositId == depositId) &&
            (identical(other.depositAmount, depositAmount) ||
                other.depositAmount == depositAmount) &&
            (identical(other.depositorName, depositorName) ||
                other.depositorName == depositorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, depositId, depositAmount,
      depositorName, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepositModelImplCopyWith<_$DepositModelImpl> get copyWith =>
      __$$DepositModelImplCopyWithImpl<_$DepositModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositModelImplToJson(
      this,
    );
  }
}

abstract class _DepositModel implements DepositModel {
  const factory _DepositModel(
      {final String id,
      final String depositId,
      final String depositAmount,
      final String depositorName,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      final DateTime? updatedAt}) = _$DepositModelImpl;

  factory _DepositModel.fromJson(Map<String, dynamic> json) =
      _$DepositModelImpl.fromJson;

  @override
  String get id;
  @override
  String get depositId;
  @override
  String get depositAmount;
  @override
  String get depositorName;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DepositModelImplCopyWith<_$DepositModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
