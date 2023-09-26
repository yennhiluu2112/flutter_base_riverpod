// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(String err) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(String err)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(String err)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_unknownFailureCopyWith<$Res> {
  factory _$$_unknownFailureCopyWith(
          _$_unknownFailure value, $Res Function(_$_unknownFailure) then) =
      __$$_unknownFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Object data});
}

/// @nodoc
class __$$_unknownFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_unknownFailure>
    implements _$$_unknownFailureCopyWith<$Res> {
  __$$_unknownFailureCopyWithImpl(
      _$_unknownFailure _value, $Res Function(_$_unknownFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_unknownFailure(
      null == data ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$_unknownFailure implements _unknownFailure {
  const _$_unknownFailure(this.data);

  @override
  final Object data;

  @override
  String toString() {
    return 'Failure.unknown(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_unknownFailure &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_unknownFailureCopyWith<_$_unknownFailure> get copyWith =>
      __$$_unknownFailureCopyWithImpl<_$_unknownFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(String err) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
  }) {
    return unknown(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(String err)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
  }) {
    return unknown?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(String err)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _unknownFailure implements Failure {
  const factory _unknownFailure(final Object data) = _$_unknownFailure;

  Object get data;
  @JsonKey(ignore: true)
  _$$_unknownFailureCopyWith<_$_unknownFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_illegalDataFailureCopyWith<$Res> {
  factory _$$_illegalDataFailureCopyWith(_$_illegalDataFailure value,
          $Res Function(_$_illegalDataFailure) then) =
      __$$_illegalDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$_illegalDataFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_illegalDataFailure>
    implements _$$_illegalDataFailureCopyWith<$Res> {
  __$$_illegalDataFailureCopyWithImpl(
      _$_illegalDataFailure _value, $Res Function(_$_illegalDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$_illegalDataFailure(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_illegalDataFailure implements _illegalDataFailure {
  const _$_illegalDataFailure(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'Failure.illegalData(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_illegalDataFailure &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_illegalDataFailureCopyWith<_$_illegalDataFailure> get copyWith =>
      __$$_illegalDataFailureCopyWithImpl<_$_illegalDataFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(String err) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
  }) {
    return illegalData(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(String err)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
  }) {
    return illegalData?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(String err)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (illegalData != null) {
      return illegalData(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
  }) {
    return illegalData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
  }) {
    return illegalData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (illegalData != null) {
      return illegalData(this);
    }
    return orElse();
  }
}

abstract class _illegalDataFailure implements Failure {
  const factory _illegalDataFailure(final String err) = _$_illegalDataFailure;

  String get err;
  @JsonKey(ignore: true)
  _$$_illegalDataFailureCopyWith<_$_illegalDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_networkFailureCopyWith<$Res> {
  factory _$$_networkFailureCopyWith(
          _$_networkFailure value, $Res Function(_$_networkFailure) then) =
      __$$_networkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_networkFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_networkFailure>
    implements _$$_networkFailureCopyWith<$Res> {
  __$$_networkFailureCopyWithImpl(
      _$_networkFailure _value, $Res Function(_$_networkFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_networkFailure implements _networkFailure {
  const _$_networkFailure();

  @override
  String toString() {
    return 'Failure.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_networkFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(String err) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(String err)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(String err)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _networkFailure implements Failure {
  const factory _networkFailure() = _$_networkFailure;
}

/// @nodoc
abstract class _$$_permissionDeniedFailureCopyWith<$Res> {
  factory _$$_permissionDeniedFailureCopyWith(_$_permissionDeniedFailure value,
          $Res Function(_$_permissionDeniedFailure) then) =
      __$$_permissionDeniedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_permissionDeniedFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_permissionDeniedFailure>
    implements _$$_permissionDeniedFailureCopyWith<$Res> {
  __$$_permissionDeniedFailureCopyWithImpl(_$_permissionDeniedFailure _value,
      $Res Function(_$_permissionDeniedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_permissionDeniedFailure implements _permissionDeniedFailure {
  const _$_permissionDeniedFailure();

  @override
  String toString() {
    return 'Failure.permissionDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_permissionDeniedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(String err) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(String err)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(String err)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class _permissionDeniedFailure implements Failure {
  const factory _permissionDeniedFailure() = _$_permissionDeniedFailure;
}
