// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_standard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThreadStandard {

 String get name;// np. "M", "MF", "UNC"
 String get description;// np. "Gwint metryczny zwykły"
 List<ThreadSize> get sizes;
/// Create a copy of ThreadStandard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadStandardCopyWith<ThreadStandard> get copyWith => _$ThreadStandardCopyWithImpl<ThreadStandard>(this as ThreadStandard, _$identity);

  /// Serializes this ThreadStandard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadStandard&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.sizes, sizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(sizes));

@override
String toString() {
  return 'ThreadStandard(name: $name, description: $description, sizes: $sizes)';
}


}

/// @nodoc
abstract mixin class $ThreadStandardCopyWith<$Res>  {
  factory $ThreadStandardCopyWith(ThreadStandard value, $Res Function(ThreadStandard) _then) = _$ThreadStandardCopyWithImpl;
@useResult
$Res call({
 String name, String description, List<ThreadSize> sizes
});




}
/// @nodoc
class _$ThreadStandardCopyWithImpl<$Res>
    implements $ThreadStandardCopyWith<$Res> {
  _$ThreadStandardCopyWithImpl(this._self, this._then);

  final ThreadStandard _self;
  final $Res Function(ThreadStandard) _then;

/// Create a copy of ThreadStandard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? sizes = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sizes: null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<ThreadSize>,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadStandard].
extension ThreadStandardPatterns on ThreadStandard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadStandard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadStandard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadStandard value)  $default,){
final _that = this;
switch (_that) {
case _ThreadStandard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadStandard value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadStandard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  List<ThreadSize> sizes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadStandard() when $default != null:
return $default(_that.name,_that.description,_that.sizes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  List<ThreadSize> sizes)  $default,) {final _that = this;
switch (_that) {
case _ThreadStandard():
return $default(_that.name,_that.description,_that.sizes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  List<ThreadSize> sizes)?  $default,) {final _that = this;
switch (_that) {
case _ThreadStandard() when $default != null:
return $default(_that.name,_that.description,_that.sizes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadStandard implements ThreadStandard {
  const _ThreadStandard({required this.name, required this.description, required final  List<ThreadSize> sizes}): _sizes = sizes;
  factory _ThreadStandard.fromJson(Map<String, dynamic> json) => _$ThreadStandardFromJson(json);

@override final  String name;
// np. "M", "MF", "UNC"
@override final  String description;
// np. "Gwint metryczny zwykły"
 final  List<ThreadSize> _sizes;
// np. "Gwint metryczny zwykły"
@override List<ThreadSize> get sizes {
  if (_sizes is EqualUnmodifiableListView) return _sizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sizes);
}


/// Create a copy of ThreadStandard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadStandardCopyWith<_ThreadStandard> get copyWith => __$ThreadStandardCopyWithImpl<_ThreadStandard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadStandardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadStandard&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._sizes, _sizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_sizes));

@override
String toString() {
  return 'ThreadStandard(name: $name, description: $description, sizes: $sizes)';
}


}

/// @nodoc
abstract mixin class _$ThreadStandardCopyWith<$Res> implements $ThreadStandardCopyWith<$Res> {
  factory _$ThreadStandardCopyWith(_ThreadStandard value, $Res Function(_ThreadStandard) _then) = __$ThreadStandardCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, List<ThreadSize> sizes
});




}
/// @nodoc
class __$ThreadStandardCopyWithImpl<$Res>
    implements _$ThreadStandardCopyWith<$Res> {
  __$ThreadStandardCopyWithImpl(this._self, this._then);

  final _ThreadStandard _self;
  final $Res Function(_ThreadStandard) _then;

/// Create a copy of ThreadStandard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? sizes = null,}) {
  return _then(_ThreadStandard(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sizes: null == sizes ? _self._sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<ThreadSize>,
  ));
}


}


/// @nodoc
mixin _$ThreadSize {

 String get label;// np. "M8"
 double get diameter;// 8.0
 double get pitch;// 1.25
 bool get isMetric;
/// Create a copy of ThreadSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadSizeCopyWith<ThreadSize> get copyWith => _$ThreadSizeCopyWithImpl<ThreadSize>(this as ThreadSize, _$identity);

  /// Serializes this ThreadSize to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadSize&&(identical(other.label, label) || other.label == label)&&(identical(other.diameter, diameter) || other.diameter == diameter)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.isMetric, isMetric) || other.isMetric == isMetric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,diameter,pitch,isMetric);

@override
String toString() {
  return 'ThreadSize(label: $label, diameter: $diameter, pitch: $pitch, isMetric: $isMetric)';
}


}

/// @nodoc
abstract mixin class $ThreadSizeCopyWith<$Res>  {
  factory $ThreadSizeCopyWith(ThreadSize value, $Res Function(ThreadSize) _then) = _$ThreadSizeCopyWithImpl;
@useResult
$Res call({
 String label, double diameter, double pitch, bool isMetric
});




}
/// @nodoc
class _$ThreadSizeCopyWithImpl<$Res>
    implements $ThreadSizeCopyWith<$Res> {
  _$ThreadSizeCopyWithImpl(this._self, this._then);

  final ThreadSize _self;
  final $Res Function(ThreadSize) _then;

/// Create a copy of ThreadSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? diameter = null,Object? pitch = null,Object? isMetric = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,diameter: null == diameter ? _self.diameter : diameter // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,isMetric: null == isMetric ? _self.isMetric : isMetric // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreadSize].
extension ThreadSizePatterns on ThreadSize {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadSize value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadSize() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadSize value)  $default,){
final _that = this;
switch (_that) {
case _ThreadSize():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadSize value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadSize() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double diameter,  double pitch,  bool isMetric)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadSize() when $default != null:
return $default(_that.label,_that.diameter,_that.pitch,_that.isMetric);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double diameter,  double pitch,  bool isMetric)  $default,) {final _that = this;
switch (_that) {
case _ThreadSize():
return $default(_that.label,_that.diameter,_that.pitch,_that.isMetric);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double diameter,  double pitch,  bool isMetric)?  $default,) {final _that = this;
switch (_that) {
case _ThreadSize() when $default != null:
return $default(_that.label,_that.diameter,_that.pitch,_that.isMetric);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreadSize implements ThreadSize {
  const _ThreadSize({required this.label, required this.diameter, required this.pitch, this.isMetric = true});
  factory _ThreadSize.fromJson(Map<String, dynamic> json) => _$ThreadSizeFromJson(json);

@override final  String label;
// np. "M8"
@override final  double diameter;
// 8.0
@override final  double pitch;
// 1.25
@override@JsonKey() final  bool isMetric;

/// Create a copy of ThreadSize
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadSizeCopyWith<_ThreadSize> get copyWith => __$ThreadSizeCopyWithImpl<_ThreadSize>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreadSizeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadSize&&(identical(other.label, label) || other.label == label)&&(identical(other.diameter, diameter) || other.diameter == diameter)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.isMetric, isMetric) || other.isMetric == isMetric));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,diameter,pitch,isMetric);

@override
String toString() {
  return 'ThreadSize(label: $label, diameter: $diameter, pitch: $pitch, isMetric: $isMetric)';
}


}

/// @nodoc
abstract mixin class _$ThreadSizeCopyWith<$Res> implements $ThreadSizeCopyWith<$Res> {
  factory _$ThreadSizeCopyWith(_ThreadSize value, $Res Function(_ThreadSize) _then) = __$ThreadSizeCopyWithImpl;
@override @useResult
$Res call({
 String label, double diameter, double pitch, bool isMetric
});




}
/// @nodoc
class __$ThreadSizeCopyWithImpl<$Res>
    implements _$ThreadSizeCopyWith<$Res> {
  __$ThreadSizeCopyWithImpl(this._self, this._then);

  final _ThreadSize _self;
  final $Res Function(_ThreadSize) _then;

/// Create a copy of ThreadSize
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? diameter = null,Object? pitch = null,Object? isMetric = null,}) {
  return _then(_ThreadSize(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,diameter: null == diameter ? _self.diameter : diameter // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,isMetric: null == isMetric ? _self.isMetric : isMetric // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
