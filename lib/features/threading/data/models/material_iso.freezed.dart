// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_iso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IsoMaterialGroup {

@JsonKey(name: 'group_id') String get groupId; String get name;@JsonKey(name: 'color') String get colorHex; List<IsoSubgroup> get subgroups; Map<String, dynamic> get factors;
/// Create a copy of IsoMaterialGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsoMaterialGroupCopyWith<IsoMaterialGroup> get copyWith => _$IsoMaterialGroupCopyWithImpl<IsoMaterialGroup>(this as IsoMaterialGroup, _$identity);

  /// Serializes this IsoMaterialGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsoMaterialGroup&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&const DeepCollectionEquality().equals(other.subgroups, subgroups)&&const DeepCollectionEquality().equals(other.factors, factors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,name,colorHex,const DeepCollectionEquality().hash(subgroups),const DeepCollectionEquality().hash(factors));

@override
String toString() {
  return 'IsoMaterialGroup(groupId: $groupId, name: $name, colorHex: $colorHex, subgroups: $subgroups, factors: $factors)';
}


}

/// @nodoc
abstract mixin class $IsoMaterialGroupCopyWith<$Res>  {
  factory $IsoMaterialGroupCopyWith(IsoMaterialGroup value, $Res Function(IsoMaterialGroup) _then) = _$IsoMaterialGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') String groupId, String name,@JsonKey(name: 'color') String colorHex, List<IsoSubgroup> subgroups, Map<String, dynamic> factors
});




}
/// @nodoc
class _$IsoMaterialGroupCopyWithImpl<$Res>
    implements $IsoMaterialGroupCopyWith<$Res> {
  _$IsoMaterialGroupCopyWithImpl(this._self, this._then);

  final IsoMaterialGroup _self;
  final $Res Function(IsoMaterialGroup) _then;

/// Create a copy of IsoMaterialGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? name = null,Object? colorHex = null,Object? subgroups = null,Object? factors = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,subgroups: null == subgroups ? _self.subgroups : subgroups // ignore: cast_nullable_to_non_nullable
as List<IsoSubgroup>,factors: null == factors ? _self.factors : factors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [IsoMaterialGroup].
extension IsoMaterialGroupPatterns on IsoMaterialGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsoMaterialGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsoMaterialGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsoMaterialGroup value)  $default,){
final _that = this;
switch (_that) {
case _IsoMaterialGroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsoMaterialGroup value)?  $default,){
final _that = this;
switch (_that) {
case _IsoMaterialGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  String groupId,  String name, @JsonKey(name: 'color')  String colorHex,  List<IsoSubgroup> subgroups,  Map<String, dynamic> factors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsoMaterialGroup() when $default != null:
return $default(_that.groupId,_that.name,_that.colorHex,_that.subgroups,_that.factors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  String groupId,  String name, @JsonKey(name: 'color')  String colorHex,  List<IsoSubgroup> subgroups,  Map<String, dynamic> factors)  $default,) {final _that = this;
switch (_that) {
case _IsoMaterialGroup():
return $default(_that.groupId,_that.name,_that.colorHex,_that.subgroups,_that.factors);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_id')  String groupId,  String name, @JsonKey(name: 'color')  String colorHex,  List<IsoSubgroup> subgroups,  Map<String, dynamic> factors)?  $default,) {final _that = this;
switch (_that) {
case _IsoMaterialGroup() when $default != null:
return $default(_that.groupId,_that.name,_that.colorHex,_that.subgroups,_that.factors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsoMaterialGroup extends IsoMaterialGroup {
  const _IsoMaterialGroup({@JsonKey(name: 'group_id') required this.groupId, required this.name, @JsonKey(name: 'color') required this.colorHex, final  List<IsoSubgroup> subgroups = const [], final  Map<String, dynamic> factors = const {}}): _subgroups = subgroups,_factors = factors,super._();
  factory _IsoMaterialGroup.fromJson(Map<String, dynamic> json) => _$IsoMaterialGroupFromJson(json);

@override@JsonKey(name: 'group_id') final  String groupId;
@override final  String name;
@override@JsonKey(name: 'color') final  String colorHex;
 final  List<IsoSubgroup> _subgroups;
@override@JsonKey() List<IsoSubgroup> get subgroups {
  if (_subgroups is EqualUnmodifiableListView) return _subgroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subgroups);
}

 final  Map<String, dynamic> _factors;
@override@JsonKey() Map<String, dynamic> get factors {
  if (_factors is EqualUnmodifiableMapView) return _factors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_factors);
}


/// Create a copy of IsoMaterialGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsoMaterialGroupCopyWith<_IsoMaterialGroup> get copyWith => __$IsoMaterialGroupCopyWithImpl<_IsoMaterialGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsoMaterialGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsoMaterialGroup&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&const DeepCollectionEquality().equals(other._subgroups, _subgroups)&&const DeepCollectionEquality().equals(other._factors, _factors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,name,colorHex,const DeepCollectionEquality().hash(_subgroups),const DeepCollectionEquality().hash(_factors));

@override
String toString() {
  return 'IsoMaterialGroup(groupId: $groupId, name: $name, colorHex: $colorHex, subgroups: $subgroups, factors: $factors)';
}


}

/// @nodoc
abstract mixin class _$IsoMaterialGroupCopyWith<$Res> implements $IsoMaterialGroupCopyWith<$Res> {
  factory _$IsoMaterialGroupCopyWith(_IsoMaterialGroup value, $Res Function(_IsoMaterialGroup) _then) = __$IsoMaterialGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') String groupId, String name,@JsonKey(name: 'color') String colorHex, List<IsoSubgroup> subgroups, Map<String, dynamic> factors
});




}
/// @nodoc
class __$IsoMaterialGroupCopyWithImpl<$Res>
    implements _$IsoMaterialGroupCopyWith<$Res> {
  __$IsoMaterialGroupCopyWithImpl(this._self, this._then);

  final _IsoMaterialGroup _self;
  final $Res Function(_IsoMaterialGroup) _then;

/// Create a copy of IsoMaterialGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? name = null,Object? colorHex = null,Object? subgroups = null,Object? factors = null,}) {
  return _then(_IsoMaterialGroup(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,subgroups: null == subgroups ? _self._subgroups : subgroups // ignore: cast_nullable_to_non_nullable
as List<IsoSubgroup>,factors: null == factors ? _self._factors : factors // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$IsoSubgroup {

 String get id; String get type;@JsonKey(name: 'v_c_hss') double get vcHss;@JsonKey(name: 'v_c_vhm') double get vcVhm;@JsonKey(name: 'hardness_range') String? get hardnessRange;
/// Create a copy of IsoSubgroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsoSubgroupCopyWith<IsoSubgroup> get copyWith => _$IsoSubgroupCopyWithImpl<IsoSubgroup>(this as IsoSubgroup, _$identity);

  /// Serializes this IsoSubgroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsoSubgroup&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.vcHss, vcHss) || other.vcHss == vcHss)&&(identical(other.vcVhm, vcVhm) || other.vcVhm == vcVhm)&&(identical(other.hardnessRange, hardnessRange) || other.hardnessRange == hardnessRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,vcHss,vcVhm,hardnessRange);

@override
String toString() {
  return 'IsoSubgroup(id: $id, type: $type, vcHss: $vcHss, vcVhm: $vcVhm, hardnessRange: $hardnessRange)';
}


}

/// @nodoc
abstract mixin class $IsoSubgroupCopyWith<$Res>  {
  factory $IsoSubgroupCopyWith(IsoSubgroup value, $Res Function(IsoSubgroup) _then) = _$IsoSubgroupCopyWithImpl;
@useResult
$Res call({
 String id, String type,@JsonKey(name: 'v_c_hss') double vcHss,@JsonKey(name: 'v_c_vhm') double vcVhm,@JsonKey(name: 'hardness_range') String? hardnessRange
});




}
/// @nodoc
class _$IsoSubgroupCopyWithImpl<$Res>
    implements $IsoSubgroupCopyWith<$Res> {
  _$IsoSubgroupCopyWithImpl(this._self, this._then);

  final IsoSubgroup _self;
  final $Res Function(IsoSubgroup) _then;

/// Create a copy of IsoSubgroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? vcHss = null,Object? vcVhm = null,Object? hardnessRange = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,vcHss: null == vcHss ? _self.vcHss : vcHss // ignore: cast_nullable_to_non_nullable
as double,vcVhm: null == vcVhm ? _self.vcVhm : vcVhm // ignore: cast_nullable_to_non_nullable
as double,hardnessRange: freezed == hardnessRange ? _self.hardnessRange : hardnessRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IsoSubgroup].
extension IsoSubgroupPatterns on IsoSubgroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsoSubgroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsoSubgroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsoSubgroup value)  $default,){
final _that = this;
switch (_that) {
case _IsoSubgroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsoSubgroup value)?  $default,){
final _that = this;
switch (_that) {
case _IsoSubgroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'v_c_hss')  double vcHss, @JsonKey(name: 'v_c_vhm')  double vcVhm, @JsonKey(name: 'hardness_range')  String? hardnessRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsoSubgroup() when $default != null:
return $default(_that.id,_that.type,_that.vcHss,_that.vcVhm,_that.hardnessRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'v_c_hss')  double vcHss, @JsonKey(name: 'v_c_vhm')  double vcVhm, @JsonKey(name: 'hardness_range')  String? hardnessRange)  $default,) {final _that = this;
switch (_that) {
case _IsoSubgroup():
return $default(_that.id,_that.type,_that.vcHss,_that.vcVhm,_that.hardnessRange);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type, @JsonKey(name: 'v_c_hss')  double vcHss, @JsonKey(name: 'v_c_vhm')  double vcVhm, @JsonKey(name: 'hardness_range')  String? hardnessRange)?  $default,) {final _that = this;
switch (_that) {
case _IsoSubgroup() when $default != null:
return $default(_that.id,_that.type,_that.vcHss,_that.vcVhm,_that.hardnessRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsoSubgroup implements IsoSubgroup {
  const _IsoSubgroup({required this.id, this.type = '', @JsonKey(name: 'v_c_hss') this.vcHss = 0.0, @JsonKey(name: 'v_c_vhm') this.vcVhm = 0.0, @JsonKey(name: 'hardness_range') this.hardnessRange});
  factory _IsoSubgroup.fromJson(Map<String, dynamic> json) => _$IsoSubgroupFromJson(json);

@override final  String id;
@override@JsonKey() final  String type;
@override@JsonKey(name: 'v_c_hss') final  double vcHss;
@override@JsonKey(name: 'v_c_vhm') final  double vcVhm;
@override@JsonKey(name: 'hardness_range') final  String? hardnessRange;

/// Create a copy of IsoSubgroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsoSubgroupCopyWith<_IsoSubgroup> get copyWith => __$IsoSubgroupCopyWithImpl<_IsoSubgroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsoSubgroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsoSubgroup&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.vcHss, vcHss) || other.vcHss == vcHss)&&(identical(other.vcVhm, vcVhm) || other.vcVhm == vcVhm)&&(identical(other.hardnessRange, hardnessRange) || other.hardnessRange == hardnessRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,vcHss,vcVhm,hardnessRange);

@override
String toString() {
  return 'IsoSubgroup(id: $id, type: $type, vcHss: $vcHss, vcVhm: $vcVhm, hardnessRange: $hardnessRange)';
}


}

/// @nodoc
abstract mixin class _$IsoSubgroupCopyWith<$Res> implements $IsoSubgroupCopyWith<$Res> {
  factory _$IsoSubgroupCopyWith(_IsoSubgroup value, $Res Function(_IsoSubgroup) _then) = __$IsoSubgroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String type,@JsonKey(name: 'v_c_hss') double vcHss,@JsonKey(name: 'v_c_vhm') double vcVhm,@JsonKey(name: 'hardness_range') String? hardnessRange
});




}
/// @nodoc
class __$IsoSubgroupCopyWithImpl<$Res>
    implements _$IsoSubgroupCopyWith<$Res> {
  __$IsoSubgroupCopyWithImpl(this._self, this._then);

  final _IsoSubgroup _self;
  final $Res Function(_IsoSubgroup) _then;

/// Create a copy of IsoSubgroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? vcHss = null,Object? vcVhm = null,Object? hardnessRange = freezed,}) {
  return _then(_IsoSubgroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,vcHss: null == vcHss ? _self.vcHss : vcHss // ignore: cast_nullable_to_non_nullable
as double,vcVhm: null == vcVhm ? _self.vcVhm : vcVhm // ignore: cast_nullable_to_non_nullable
as double,hardnessRange: freezed == hardnessRange ? _self.hardnessRange : hardnessRange // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
