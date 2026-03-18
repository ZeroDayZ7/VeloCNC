// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_calculation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedCalculationDto {

 double get vf; double get adjustedVf; double get fz; int get z; double get n; double get toolDiameter; double get featureDiameter; bool get isInternal;
/// Create a copy of FeedCalculationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedCalculationDtoCopyWith<FeedCalculationDto> get copyWith => _$FeedCalculationDtoCopyWithImpl<FeedCalculationDto>(this as FeedCalculationDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedCalculationDto&&(identical(other.vf, vf) || other.vf == vf)&&(identical(other.adjustedVf, adjustedVf) || other.adjustedVf == adjustedVf)&&(identical(other.fz, fz) || other.fz == fz)&&(identical(other.z, z) || other.z == z)&&(identical(other.n, n) || other.n == n)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal));
}


@override
int get hashCode => Object.hash(runtimeType,vf,adjustedVf,fz,z,n,toolDiameter,featureDiameter,isInternal);

@override
String toString() {
  return 'FeedCalculationDto(vf: $vf, adjustedVf: $adjustedVf, fz: $fz, z: $z, n: $n, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, isInternal: $isInternal)';
}


}

/// @nodoc
abstract mixin class $FeedCalculationDtoCopyWith<$Res>  {
  factory $FeedCalculationDtoCopyWith(FeedCalculationDto value, $Res Function(FeedCalculationDto) _then) = _$FeedCalculationDtoCopyWithImpl;
@useResult
$Res call({
 double vf, double adjustedVf, double fz, int z, double n, double toolDiameter, double featureDiameter, bool isInternal
});




}
/// @nodoc
class _$FeedCalculationDtoCopyWithImpl<$Res>
    implements $FeedCalculationDtoCopyWith<$Res> {
  _$FeedCalculationDtoCopyWithImpl(this._self, this._then);

  final FeedCalculationDto _self;
  final $Res Function(FeedCalculationDto) _then;

/// Create a copy of FeedCalculationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vf = null,Object? adjustedVf = null,Object? fz = null,Object? z = null,Object? n = null,Object? toolDiameter = null,Object? featureDiameter = null,Object? isInternal = null,}) {
  return _then(_self.copyWith(
vf: null == vf ? _self.vf : vf // ignore: cast_nullable_to_non_nullable
as double,adjustedVf: null == adjustedVf ? _self.adjustedVf : adjustedVf // ignore: cast_nullable_to_non_nullable
as double,fz: null == fz ? _self.fz : fz // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as double,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: null == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedCalculationDto].
extension FeedCalculationDtoPatterns on FeedCalculationDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedCalculationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedCalculationDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedCalculationDto value)  $default,){
final _that = this;
switch (_that) {
case _FeedCalculationDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedCalculationDto value)?  $default,){
final _that = this;
switch (_that) {
case _FeedCalculationDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double vf,  double adjustedVf,  double fz,  int z,  double n,  double toolDiameter,  double featureDiameter,  bool isInternal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedCalculationDto() when $default != null:
return $default(_that.vf,_that.adjustedVf,_that.fz,_that.z,_that.n,_that.toolDiameter,_that.featureDiameter,_that.isInternal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double vf,  double adjustedVf,  double fz,  int z,  double n,  double toolDiameter,  double featureDiameter,  bool isInternal)  $default,) {final _that = this;
switch (_that) {
case _FeedCalculationDto():
return $default(_that.vf,_that.adjustedVf,_that.fz,_that.z,_that.n,_that.toolDiameter,_that.featureDiameter,_that.isInternal);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double vf,  double adjustedVf,  double fz,  int z,  double n,  double toolDiameter,  double featureDiameter,  bool isInternal)?  $default,) {final _that = this;
switch (_that) {
case _FeedCalculationDto() when $default != null:
return $default(_that.vf,_that.adjustedVf,_that.fz,_that.z,_that.n,_that.toolDiameter,_that.featureDiameter,_that.isInternal);case _:
  return null;

}
}

}

/// @nodoc


class _FeedCalculationDto implements FeedCalculationDto {
  const _FeedCalculationDto({required this.vf, required this.adjustedVf, required this.fz, required this.z, required this.n, required this.toolDiameter, required this.featureDiameter, required this.isInternal});
  

@override final  double vf;
@override final  double adjustedVf;
@override final  double fz;
@override final  int z;
@override final  double n;
@override final  double toolDiameter;
@override final  double featureDiameter;
@override final  bool isInternal;

/// Create a copy of FeedCalculationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedCalculationDtoCopyWith<_FeedCalculationDto> get copyWith => __$FeedCalculationDtoCopyWithImpl<_FeedCalculationDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedCalculationDto&&(identical(other.vf, vf) || other.vf == vf)&&(identical(other.adjustedVf, adjustedVf) || other.adjustedVf == adjustedVf)&&(identical(other.fz, fz) || other.fz == fz)&&(identical(other.z, z) || other.z == z)&&(identical(other.n, n) || other.n == n)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal));
}


@override
int get hashCode => Object.hash(runtimeType,vf,adjustedVf,fz,z,n,toolDiameter,featureDiameter,isInternal);

@override
String toString() {
  return 'FeedCalculationDto(vf: $vf, adjustedVf: $adjustedVf, fz: $fz, z: $z, n: $n, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, isInternal: $isInternal)';
}


}

/// @nodoc
abstract mixin class _$FeedCalculationDtoCopyWith<$Res> implements $FeedCalculationDtoCopyWith<$Res> {
  factory _$FeedCalculationDtoCopyWith(_FeedCalculationDto value, $Res Function(_FeedCalculationDto) _then) = __$FeedCalculationDtoCopyWithImpl;
@override @useResult
$Res call({
 double vf, double adjustedVf, double fz, int z, double n, double toolDiameter, double featureDiameter, bool isInternal
});




}
/// @nodoc
class __$FeedCalculationDtoCopyWithImpl<$Res>
    implements _$FeedCalculationDtoCopyWith<$Res> {
  __$FeedCalculationDtoCopyWithImpl(this._self, this._then);

  final _FeedCalculationDto _self;
  final $Res Function(_FeedCalculationDto) _then;

/// Create a copy of FeedCalculationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vf = null,Object? adjustedVf = null,Object? fz = null,Object? z = null,Object? n = null,Object? toolDiameter = null,Object? featureDiameter = null,Object? isInternal = null,}) {
  return _then(_FeedCalculationDto(
vf: null == vf ? _self.vf : vf // ignore: cast_nullable_to_non_nullable
as double,adjustedVf: null == adjustedVf ? _self.adjustedVf : adjustedVf // ignore: cast_nullable_to_non_nullable
as double,fz: null == fz ? _self.fz : fz // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as double,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: null == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
