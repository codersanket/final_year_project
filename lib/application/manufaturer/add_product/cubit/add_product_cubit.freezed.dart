// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddProductStateTearOff {
  const _$AddProductStateTearOff();

  _AddProductState call(
      {String? brand,
      String? model,
      String? description,
      AddProductStateStatus? status}) {
    return _AddProductState(
      brand: brand,
      model: model,
      description: description,
      status: status,
    );
  }
}

/// @nodoc
const $AddProductState = _$AddProductStateTearOff();

/// @nodoc
mixin _$AddProductState {
  String? get brand => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  AddProductStateStatus? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductStateCopyWith<AddProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductStateCopyWith<$Res> {
  factory $AddProductStateCopyWith(
          AddProductState value, $Res Function(AddProductState) then) =
      _$AddProductStateCopyWithImpl<$Res>;
  $Res call(
      {String? brand,
      String? model,
      String? description,
      AddProductStateStatus? status});
}

/// @nodoc
class _$AddProductStateCopyWithImpl<$Res>
    implements $AddProductStateCopyWith<$Res> {
  _$AddProductStateCopyWithImpl(this._value, this._then);

  final AddProductState _value;
  // ignore: unused_field
  final $Res Function(AddProductState) _then;

  @override
  $Res call({
    Object? brand = freezed,
    Object? model = freezed,
    Object? description = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddProductStateStatus?,
    ));
  }
}

/// @nodoc
abstract class _$AddProductStateCopyWith<$Res>
    implements $AddProductStateCopyWith<$Res> {
  factory _$AddProductStateCopyWith(
          _AddProductState value, $Res Function(_AddProductState) then) =
      __$AddProductStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? brand,
      String? model,
      String? description,
      AddProductStateStatus? status});
}

/// @nodoc
class __$AddProductStateCopyWithImpl<$Res>
    extends _$AddProductStateCopyWithImpl<$Res>
    implements _$AddProductStateCopyWith<$Res> {
  __$AddProductStateCopyWithImpl(
      _AddProductState _value, $Res Function(_AddProductState) _then)
      : super(_value, (v) => _then(v as _AddProductState));

  @override
  _AddProductState get _value => super._value as _AddProductState;

  @override
  $Res call({
    Object? brand = freezed,
    Object? model = freezed,
    Object? description = freezed,
    Object? status = freezed,
  }) {
    return _then(_AddProductState(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddProductStateStatus?,
    ));
  }
}

/// @nodoc

class _$_AddProductState
    with DiagnosticableTreeMixin
    implements _AddProductState {
  _$_AddProductState({this.brand, this.model, this.description, this.status});

  @override
  final String? brand;
  @override
  final String? model;
  @override
  final String? description;
  @override
  final AddProductStateStatus? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddProductState(brand: $brand, model: $model, description: $description, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddProductState'))
      ..add(DiagnosticsProperty('brand', brand))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddProductState &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$AddProductStateCopyWith<_AddProductState> get copyWith =>
      __$AddProductStateCopyWithImpl<_AddProductState>(this, _$identity);
}

abstract class _AddProductState implements AddProductState {
  factory _AddProductState(
      {String? brand,
      String? model,
      String? description,
      AddProductStateStatus? status}) = _$_AddProductState;

  @override
  String? get brand;
  @override
  String? get model;
  @override
  String? get description;
  @override
  AddProductStateStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$AddProductStateCopyWith<_AddProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
