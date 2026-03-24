// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedHistoryItem {

 int get id; double get vf; double get n; double get fz; int get z; double get toolDiameter; double? get featureDiameter; DateTime get createdAt;
/// Create a copy of FeedHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedHistoryItemCopyWith<FeedHistoryItem> get copyWith => _$FeedHistoryItemCopyWithImpl<FeedHistoryItem>(this as FeedHistoryItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.vf, vf) || other.vf == vf)&&(identical(other.n, n) || other.n == n)&&(identical(other.fz, fz) || other.fz == fz)&&(identical(other.z, z) || other.z == z)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,vf,n,fz,z,toolDiameter,featureDiameter,createdAt);

@override
String toString() {
  return 'FeedHistoryItem(id: $id, vf: $vf, n: $n, fz: $fz, z: $z, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FeedHistoryItemCopyWith<$Res>  {
  factory $FeedHistoryItemCopyWith(FeedHistoryItem value, $Res Function(FeedHistoryItem) _then) = _$FeedHistoryItemCopyWithImpl;
@useResult
$Res call({
 int id, double vf, double n, double fz, int z, double toolDiameter, double? featureDiameter, DateTime createdAt
});




}
/// @nodoc
class _$FeedHistoryItemCopyWithImpl<$Res>
    implements $FeedHistoryItemCopyWith<$Res> {
  _$FeedHistoryItemCopyWithImpl(this._self, this._then);

  final FeedHistoryItem _self;
  final $Res Function(FeedHistoryItem) _then;

/// Create a copy of FeedHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vf = null,Object? n = null,Object? fz = null,Object? z = null,Object? toolDiameter = null,Object? featureDiameter = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vf: null == vf ? _self.vf : vf // ignore: cast_nullable_to_non_nullable
as double,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as double,fz: null == fz ? _self.fz : fz // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: freezed == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedHistoryItem].
extension FeedHistoryItemPatterns on FeedHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _FeedHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _FeedHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double vf,  double n,  double fz,  int z,  double toolDiameter,  double? featureDiameter,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedHistoryItem() when $default != null:
return $default(_that.id,_that.vf,_that.n,_that.fz,_that.z,_that.toolDiameter,_that.featureDiameter,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double vf,  double n,  double fz,  int z,  double toolDiameter,  double? featureDiameter,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FeedHistoryItem():
return $default(_that.id,_that.vf,_that.n,_that.fz,_that.z,_that.toolDiameter,_that.featureDiameter,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double vf,  double n,  double fz,  int z,  double toolDiameter,  double? featureDiameter,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedHistoryItem() when $default != null:
return $default(_that.id,_that.vf,_that.n,_that.fz,_that.z,_that.toolDiameter,_that.featureDiameter,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FeedHistoryItem implements FeedHistoryItem {
  const _FeedHistoryItem({required this.id, required this.vf, required this.n, required this.fz, required this.z, required this.toolDiameter, this.featureDiameter, required this.createdAt});
  

@override final  int id;
@override final  double vf;
@override final  double n;
@override final  double fz;
@override final  int z;
@override final  double toolDiameter;
@override final  double? featureDiameter;
@override final  DateTime createdAt;

/// Create a copy of FeedHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedHistoryItemCopyWith<_FeedHistoryItem> get copyWith => __$FeedHistoryItemCopyWithImpl<_FeedHistoryItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.vf, vf) || other.vf == vf)&&(identical(other.n, n) || other.n == n)&&(identical(other.fz, fz) || other.fz == fz)&&(identical(other.z, z) || other.z == z)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,vf,n,fz,z,toolDiameter,featureDiameter,createdAt);

@override
String toString() {
  return 'FeedHistoryItem(id: $id, vf: $vf, n: $n, fz: $fz, z: $z, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FeedHistoryItemCopyWith<$Res> implements $FeedHistoryItemCopyWith<$Res> {
  factory _$FeedHistoryItemCopyWith(_FeedHistoryItem value, $Res Function(_FeedHistoryItem) _then) = __$FeedHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 int id, double vf, double n, double fz, int z, double toolDiameter, double? featureDiameter, DateTime createdAt
});




}
/// @nodoc
class __$FeedHistoryItemCopyWithImpl<$Res>
    implements _$FeedHistoryItemCopyWith<$Res> {
  __$FeedHistoryItemCopyWithImpl(this._self, this._then);

  final _FeedHistoryItem _self;
  final $Res Function(_FeedHistoryItem) _then;

/// Create a copy of FeedHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vf = null,Object? n = null,Object? fz = null,Object? z = null,Object? toolDiameter = null,Object? featureDiameter = freezed,Object? createdAt = null,}) {
  return _then(_FeedHistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vf: null == vf ? _self.vf : vf // ignore: cast_nullable_to_non_nullable
as double,n: null == n ? _self.n : n // ignore: cast_nullable_to_non_nullable
as double,fz: null == fz ? _self.fz : fz // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as int,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: freezed == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
