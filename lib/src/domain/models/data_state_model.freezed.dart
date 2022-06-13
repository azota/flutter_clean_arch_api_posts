// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateSuccess<T> value) success,
    required TResult Function(DataStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<T, $Res> {
  factory $DataStateCopyWith(
          DataState<T> value, $Res Function(DataState<T>) then) =
      _$DataStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DataStateCopyWithImpl<T, $Res> implements $DataStateCopyWith<T, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  final DataState<T> _value;
  // ignore: unused_field
  final $Res Function(DataState<T>) _then;
}

/// @nodoc
abstract class _$$DataStateSuccessCopyWith<T, $Res> {
  factory _$$DataStateSuccessCopyWith(_$DataStateSuccess<T> value,
          $Res Function(_$DataStateSuccess<T>) then) =
      __$$DataStateSuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$DataStateSuccessCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements _$$DataStateSuccessCopyWith<T, $Res> {
  __$$DataStateSuccessCopyWithImpl(
      _$DataStateSuccess<T> _value, $Res Function(_$DataStateSuccess<T>) _then)
      : super(_value, (v) => _then(v as _$DataStateSuccess<T>));

  @override
  _$DataStateSuccess<T> get _value => super._value as _$DataStateSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DataStateSuccess<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DataStateSuccess<T> implements DataStateSuccess<T> {
  const _$DataStateSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DataState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStateSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$DataStateSuccessCopyWith<T, _$DataStateSuccess<T>> get copyWith =>
      __$$DataStateSuccessCopyWithImpl<T, _$DataStateSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error, String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateSuccess<T> value) success,
    required TResult Function(DataStateError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DataStateSuccess<T> implements DataState<T> {
  const factory DataStateSuccess(final T data) = _$DataStateSuccess<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DataStateSuccessCopyWith<T, _$DataStateSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataStateErrorCopyWith<T, $Res> {
  factory _$$DataStateErrorCopyWith(
          _$DataStateError<T> value, $Res Function(_$DataStateError<T>) then) =
      __$$DataStateErrorCopyWithImpl<T, $Res>;
  $Res call({Exception error, String message});
}

/// @nodoc
class __$$DataStateErrorCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements _$$DataStateErrorCopyWith<T, $Res> {
  __$$DataStateErrorCopyWithImpl(
      _$DataStateError<T> _value, $Res Function(_$DataStateError<T>) _then)
      : super(_value, (v) => _then(v as _$DataStateError<T>));

  @override
  _$DataStateError<T> get _value => super._value as _$DataStateError<T>;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DataStateError<T>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataStateError<T> implements DataStateError<T> {
  const _$DataStateError(this.error, this.message);

  @override
  final Exception error;
  @override
  final String message;

  @override
  String toString() {
    return 'DataState<$T>.error(error: $error, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStateError<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$DataStateErrorCopyWith<T, _$DataStateError<T>> get copyWith =>
      __$$DataStateErrorCopyWithImpl<T, _$DataStateError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Exception error, String message) error,
  }) {
    return error(this.error, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
  }) {
    return error?.call(this.error, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Exception error, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateSuccess<T> value) success,
    required TResult Function(DataStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateSuccess<T> value)? success,
    TResult Function(DataStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DataStateError<T> implements DataState<T> {
  const factory DataStateError(final Exception error, final String message) =
      _$DataStateError<T>;

  Exception get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DataStateErrorCopyWith<T, _$DataStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
