// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tolerance_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TolerancePageState {

 ToleranceType get type; String get diameterInput; String? get selectedLetter; String? get selectedNumber; ToleranceResult? get result; List<String> get availableLetters; List<String> get availableNumbers;
/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TolerancePageStateCopyWith<TolerancePageState> get copyWith => _$TolerancePageStateCopyWithImpl<TolerancePageState>(this as TolerancePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TolerancePageState&&(identical(other.type, type) || other.type == type)&&(identical(other.diameterInput, diameterInput) || other.diameterInput == diameterInput)&&(identical(other.selectedLetter, selectedLetter) || other.selectedLetter == selectedLetter)&&(identical(other.selectedNumber, selectedNumber) || other.selectedNumber == selectedNumber)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other.availableLetters, availableLetters)&&const DeepCollectionEquality().equals(other.availableNumbers, availableNumbers));
}


@override
int get hashCode => Object.hash(runtimeType,type,diameterInput,selectedLetter,selectedNumber,result,const DeepCollectionEquality().hash(availableLetters),const DeepCollectionEquality().hash(availableNumbers));

@override
String toString() {
  return 'TolerancePageState(type: $type, diameterInput: $diameterInput, selectedLetter: $selectedLetter, selectedNumber: $selectedNumber, result: $result, availableLetters: $availableLetters, availableNumbers: $availableNumbers)';
}


}

/// @nodoc
abstract mixin class $TolerancePageStateCopyWith<$Res>  {
  factory $TolerancePageStateCopyWith(TolerancePageState value, $Res Function(TolerancePageState) _then) = _$TolerancePageStateCopyWithImpl;
@useResult
$Res call({
 ToleranceType type, String diameterInput, String? selectedLetter, String? selectedNumber, ToleranceResult? result, List<String> availableLetters, List<String> availableNumbers
});


$ToleranceResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$TolerancePageStateCopyWithImpl<$Res>
    implements $TolerancePageStateCopyWith<$Res> {
  _$TolerancePageStateCopyWithImpl(this._self, this._then);

  final TolerancePageState _self;
  final $Res Function(TolerancePageState) _then;

/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? diameterInput = null,Object? selectedLetter = freezed,Object? selectedNumber = freezed,Object? result = freezed,Object? availableLetters = null,Object? availableNumbers = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToleranceType,diameterInput: null == diameterInput ? _self.diameterInput : diameterInput // ignore: cast_nullable_to_non_nullable
as String,selectedLetter: freezed == selectedLetter ? _self.selectedLetter : selectedLetter // ignore: cast_nullable_to_non_nullable
as String?,selectedNumber: freezed == selectedNumber ? _self.selectedNumber : selectedNumber // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ToleranceResult?,availableLetters: null == availableLetters ? _self.availableLetters : availableLetters // ignore: cast_nullable_to_non_nullable
as List<String>,availableNumbers: null == availableNumbers ? _self.availableNumbers : availableNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToleranceResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ToleranceResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [TolerancePageState].
extension TolerancePageStatePatterns on TolerancePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TolerancePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TolerancePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TolerancePageState value)  $default,){
final _that = this;
switch (_that) {
case _TolerancePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TolerancePageState value)?  $default,){
final _that = this;
switch (_that) {
case _TolerancePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToleranceType type,  String diameterInput,  String? selectedLetter,  String? selectedNumber,  ToleranceResult? result,  List<String> availableLetters,  List<String> availableNumbers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TolerancePageState() when $default != null:
return $default(_that.type,_that.diameterInput,_that.selectedLetter,_that.selectedNumber,_that.result,_that.availableLetters,_that.availableNumbers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToleranceType type,  String diameterInput,  String? selectedLetter,  String? selectedNumber,  ToleranceResult? result,  List<String> availableLetters,  List<String> availableNumbers)  $default,) {final _that = this;
switch (_that) {
case _TolerancePageState():
return $default(_that.type,_that.diameterInput,_that.selectedLetter,_that.selectedNumber,_that.result,_that.availableLetters,_that.availableNumbers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToleranceType type,  String diameterInput,  String? selectedLetter,  String? selectedNumber,  ToleranceResult? result,  List<String> availableLetters,  List<String> availableNumbers)?  $default,) {final _that = this;
switch (_that) {
case _TolerancePageState() when $default != null:
return $default(_that.type,_that.diameterInput,_that.selectedLetter,_that.selectedNumber,_that.result,_that.availableLetters,_that.availableNumbers);case _:
  return null;

}
}

}

/// @nodoc


class _TolerancePageState implements TolerancePageState {
  const _TolerancePageState({this.type = ToleranceType.hole, this.diameterInput = '', this.selectedLetter, this.selectedNumber, this.result, final  List<String> availableLetters = const [], final  List<String> availableNumbers = const []}): _availableLetters = availableLetters,_availableNumbers = availableNumbers;
  

@override@JsonKey() final  ToleranceType type;
@override@JsonKey() final  String diameterInput;
@override final  String? selectedLetter;
@override final  String? selectedNumber;
@override final  ToleranceResult? result;
 final  List<String> _availableLetters;
@override@JsonKey() List<String> get availableLetters {
  if (_availableLetters is EqualUnmodifiableListView) return _availableLetters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableLetters);
}

 final  List<String> _availableNumbers;
@override@JsonKey() List<String> get availableNumbers {
  if (_availableNumbers is EqualUnmodifiableListView) return _availableNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableNumbers);
}


/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TolerancePageStateCopyWith<_TolerancePageState> get copyWith => __$TolerancePageStateCopyWithImpl<_TolerancePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TolerancePageState&&(identical(other.type, type) || other.type == type)&&(identical(other.diameterInput, diameterInput) || other.diameterInput == diameterInput)&&(identical(other.selectedLetter, selectedLetter) || other.selectedLetter == selectedLetter)&&(identical(other.selectedNumber, selectedNumber) || other.selectedNumber == selectedNumber)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other._availableLetters, _availableLetters)&&const DeepCollectionEquality().equals(other._availableNumbers, _availableNumbers));
}


@override
int get hashCode => Object.hash(runtimeType,type,diameterInput,selectedLetter,selectedNumber,result,const DeepCollectionEquality().hash(_availableLetters),const DeepCollectionEquality().hash(_availableNumbers));

@override
String toString() {
  return 'TolerancePageState(type: $type, diameterInput: $diameterInput, selectedLetter: $selectedLetter, selectedNumber: $selectedNumber, result: $result, availableLetters: $availableLetters, availableNumbers: $availableNumbers)';
}


}

/// @nodoc
abstract mixin class _$TolerancePageStateCopyWith<$Res> implements $TolerancePageStateCopyWith<$Res> {
  factory _$TolerancePageStateCopyWith(_TolerancePageState value, $Res Function(_TolerancePageState) _then) = __$TolerancePageStateCopyWithImpl;
@override @useResult
$Res call({
 ToleranceType type, String diameterInput, String? selectedLetter, String? selectedNumber, ToleranceResult? result, List<String> availableLetters, List<String> availableNumbers
});


@override $ToleranceResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$TolerancePageStateCopyWithImpl<$Res>
    implements _$TolerancePageStateCopyWith<$Res> {
  __$TolerancePageStateCopyWithImpl(this._self, this._then);

  final _TolerancePageState _self;
  final $Res Function(_TolerancePageState) _then;

/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? diameterInput = null,Object? selectedLetter = freezed,Object? selectedNumber = freezed,Object? result = freezed,Object? availableLetters = null,Object? availableNumbers = null,}) {
  return _then(_TolerancePageState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ToleranceType,diameterInput: null == diameterInput ? _self.diameterInput : diameterInput // ignore: cast_nullable_to_non_nullable
as String,selectedLetter: freezed == selectedLetter ? _self.selectedLetter : selectedLetter // ignore: cast_nullable_to_non_nullable
as String?,selectedNumber: freezed == selectedNumber ? _self.selectedNumber : selectedNumber // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as ToleranceResult?,availableLetters: null == availableLetters ? _self._availableLetters : availableLetters // ignore: cast_nullable_to_non_nullable
as List<String>,availableNumbers: null == availableNumbers ? _self._availableNumbers : availableNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of TolerancePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToleranceResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $ToleranceResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// @nodoc
mixin _$ToleranceRange {

 double get min; double get max; double? get upper; double? get lower;@JsonKey(name: 'restriction_key') String? get restrictionKey;@JsonKey(name: 'info_key') String? get infoKey;
/// Create a copy of ToleranceRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToleranceRangeCopyWith<ToleranceRange> get copyWith => _$ToleranceRangeCopyWithImpl<ToleranceRange>(this as ToleranceRange, _$identity);

  /// Serializes this ToleranceRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToleranceRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.upper, upper) || other.upper == upper)&&(identical(other.lower, lower) || other.lower == lower)&&(identical(other.restrictionKey, restrictionKey) || other.restrictionKey == restrictionKey)&&(identical(other.infoKey, infoKey) || other.infoKey == infoKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max,upper,lower,restrictionKey,infoKey);

@override
String toString() {
  return 'ToleranceRange(min: $min, max: $max, upper: $upper, lower: $lower, restrictionKey: $restrictionKey, infoKey: $infoKey)';
}


}

/// @nodoc
abstract mixin class $ToleranceRangeCopyWith<$Res>  {
  factory $ToleranceRangeCopyWith(ToleranceRange value, $Res Function(ToleranceRange) _then) = _$ToleranceRangeCopyWithImpl;
@useResult
$Res call({
 double min, double max, double? upper, double? lower,@JsonKey(name: 'restriction_key') String? restrictionKey,@JsonKey(name: 'info_key') String? infoKey
});




}
/// @nodoc
class _$ToleranceRangeCopyWithImpl<$Res>
    implements $ToleranceRangeCopyWith<$Res> {
  _$ToleranceRangeCopyWithImpl(this._self, this._then);

  final ToleranceRange _self;
  final $Res Function(ToleranceRange) _then;

/// Create a copy of ToleranceRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,Object? upper = freezed,Object? lower = freezed,Object? restrictionKey = freezed,Object? infoKey = freezed,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,upper: freezed == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as double?,lower: freezed == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as double?,restrictionKey: freezed == restrictionKey ? _self.restrictionKey : restrictionKey // ignore: cast_nullable_to_non_nullable
as String?,infoKey: freezed == infoKey ? _self.infoKey : infoKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ToleranceRange].
extension ToleranceRangePatterns on ToleranceRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToleranceRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToleranceRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToleranceRange value)  $default,){
final _that = this;
switch (_that) {
case _ToleranceRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToleranceRange value)?  $default,){
final _that = this;
switch (_that) {
case _ToleranceRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double min,  double max,  double? upper,  double? lower, @JsonKey(name: 'restriction_key')  String? restrictionKey, @JsonKey(name: 'info_key')  String? infoKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToleranceRange() when $default != null:
return $default(_that.min,_that.max,_that.upper,_that.lower,_that.restrictionKey,_that.infoKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double min,  double max,  double? upper,  double? lower, @JsonKey(name: 'restriction_key')  String? restrictionKey, @JsonKey(name: 'info_key')  String? infoKey)  $default,) {final _that = this;
switch (_that) {
case _ToleranceRange():
return $default(_that.min,_that.max,_that.upper,_that.lower,_that.restrictionKey,_that.infoKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double min,  double max,  double? upper,  double? lower, @JsonKey(name: 'restriction_key')  String? restrictionKey, @JsonKey(name: 'info_key')  String? infoKey)?  $default,) {final _that = this;
switch (_that) {
case _ToleranceRange() when $default != null:
return $default(_that.min,_that.max,_that.upper,_that.lower,_that.restrictionKey,_that.infoKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToleranceRange implements ToleranceRange {
  const _ToleranceRange({this.min = 0.0, this.max = 0.0, this.upper, this.lower, @JsonKey(name: 'restriction_key') this.restrictionKey, @JsonKey(name: 'info_key') this.infoKey});
  factory _ToleranceRange.fromJson(Map<String, dynamic> json) => _$ToleranceRangeFromJson(json);

@override@JsonKey() final  double min;
@override@JsonKey() final  double max;
@override final  double? upper;
@override final  double? lower;
@override@JsonKey(name: 'restriction_key') final  String? restrictionKey;
@override@JsonKey(name: 'info_key') final  String? infoKey;

/// Create a copy of ToleranceRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToleranceRangeCopyWith<_ToleranceRange> get copyWith => __$ToleranceRangeCopyWithImpl<_ToleranceRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToleranceRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToleranceRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.upper, upper) || other.upper == upper)&&(identical(other.lower, lower) || other.lower == lower)&&(identical(other.restrictionKey, restrictionKey) || other.restrictionKey == restrictionKey)&&(identical(other.infoKey, infoKey) || other.infoKey == infoKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max,upper,lower,restrictionKey,infoKey);

@override
String toString() {
  return 'ToleranceRange(min: $min, max: $max, upper: $upper, lower: $lower, restrictionKey: $restrictionKey, infoKey: $infoKey)';
}


}

/// @nodoc
abstract mixin class _$ToleranceRangeCopyWith<$Res> implements $ToleranceRangeCopyWith<$Res> {
  factory _$ToleranceRangeCopyWith(_ToleranceRange value, $Res Function(_ToleranceRange) _then) = __$ToleranceRangeCopyWithImpl;
@override @useResult
$Res call({
 double min, double max, double? upper, double? lower,@JsonKey(name: 'restriction_key') String? restrictionKey,@JsonKey(name: 'info_key') String? infoKey
});




}
/// @nodoc
class __$ToleranceRangeCopyWithImpl<$Res>
    implements _$ToleranceRangeCopyWith<$Res> {
  __$ToleranceRangeCopyWithImpl(this._self, this._then);

  final _ToleranceRange _self;
  final $Res Function(_ToleranceRange) _then;

/// Create a copy of ToleranceRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,Object? upper = freezed,Object? lower = freezed,Object? restrictionKey = freezed,Object? infoKey = freezed,}) {
  return _then(_ToleranceRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,upper: freezed == upper ? _self.upper : upper // ignore: cast_nullable_to_non_nullable
as double?,lower: freezed == lower ? _self.lower : lower // ignore: cast_nullable_to_non_nullable
as double?,restrictionKey: freezed == restrictionKey ? _self.restrictionKey : restrictionKey // ignore: cast_nullable_to_non_nullable
as String?,infoKey: freezed == infoKey ? _self.infoKey : infoKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ToleranceResult {

 double? get upperDeviation; double? get lowerDeviation; double? get minSize; double? get maxSize; String? get restrictionKey; String? get infoKey;
/// Create a copy of ToleranceResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToleranceResultCopyWith<ToleranceResult> get copyWith => _$ToleranceResultCopyWithImpl<ToleranceResult>(this as ToleranceResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToleranceResult&&(identical(other.upperDeviation, upperDeviation) || other.upperDeviation == upperDeviation)&&(identical(other.lowerDeviation, lowerDeviation) || other.lowerDeviation == lowerDeviation)&&(identical(other.minSize, minSize) || other.minSize == minSize)&&(identical(other.maxSize, maxSize) || other.maxSize == maxSize)&&(identical(other.restrictionKey, restrictionKey) || other.restrictionKey == restrictionKey)&&(identical(other.infoKey, infoKey) || other.infoKey == infoKey));
}


@override
int get hashCode => Object.hash(runtimeType,upperDeviation,lowerDeviation,minSize,maxSize,restrictionKey,infoKey);

@override
String toString() {
  return 'ToleranceResult(upperDeviation: $upperDeviation, lowerDeviation: $lowerDeviation, minSize: $minSize, maxSize: $maxSize, restrictionKey: $restrictionKey, infoKey: $infoKey)';
}


}

/// @nodoc
abstract mixin class $ToleranceResultCopyWith<$Res>  {
  factory $ToleranceResultCopyWith(ToleranceResult value, $Res Function(ToleranceResult) _then) = _$ToleranceResultCopyWithImpl;
@useResult
$Res call({
 double? upperDeviation, double? lowerDeviation, double? minSize, double? maxSize, String? restrictionKey, String? infoKey
});




}
/// @nodoc
class _$ToleranceResultCopyWithImpl<$Res>
    implements $ToleranceResultCopyWith<$Res> {
  _$ToleranceResultCopyWithImpl(this._self, this._then);

  final ToleranceResult _self;
  final $Res Function(ToleranceResult) _then;

/// Create a copy of ToleranceResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upperDeviation = freezed,Object? lowerDeviation = freezed,Object? minSize = freezed,Object? maxSize = freezed,Object? restrictionKey = freezed,Object? infoKey = freezed,}) {
  return _then(_self.copyWith(
upperDeviation: freezed == upperDeviation ? _self.upperDeviation : upperDeviation // ignore: cast_nullable_to_non_nullable
as double?,lowerDeviation: freezed == lowerDeviation ? _self.lowerDeviation : lowerDeviation // ignore: cast_nullable_to_non_nullable
as double?,minSize: freezed == minSize ? _self.minSize : minSize // ignore: cast_nullable_to_non_nullable
as double?,maxSize: freezed == maxSize ? _self.maxSize : maxSize // ignore: cast_nullable_to_non_nullable
as double?,restrictionKey: freezed == restrictionKey ? _self.restrictionKey : restrictionKey // ignore: cast_nullable_to_non_nullable
as String?,infoKey: freezed == infoKey ? _self.infoKey : infoKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ToleranceResult].
extension ToleranceResultPatterns on ToleranceResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToleranceResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToleranceResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToleranceResult value)  $default,){
final _that = this;
switch (_that) {
case _ToleranceResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToleranceResult value)?  $default,){
final _that = this;
switch (_that) {
case _ToleranceResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? upperDeviation,  double? lowerDeviation,  double? minSize,  double? maxSize,  String? restrictionKey,  String? infoKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToleranceResult() when $default != null:
return $default(_that.upperDeviation,_that.lowerDeviation,_that.minSize,_that.maxSize,_that.restrictionKey,_that.infoKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? upperDeviation,  double? lowerDeviation,  double? minSize,  double? maxSize,  String? restrictionKey,  String? infoKey)  $default,) {final _that = this;
switch (_that) {
case _ToleranceResult():
return $default(_that.upperDeviation,_that.lowerDeviation,_that.minSize,_that.maxSize,_that.restrictionKey,_that.infoKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? upperDeviation,  double? lowerDeviation,  double? minSize,  double? maxSize,  String? restrictionKey,  String? infoKey)?  $default,) {final _that = this;
switch (_that) {
case _ToleranceResult() when $default != null:
return $default(_that.upperDeviation,_that.lowerDeviation,_that.minSize,_that.maxSize,_that.restrictionKey,_that.infoKey);case _:
  return null;

}
}

}

/// @nodoc


class _ToleranceResult implements ToleranceResult {
  const _ToleranceResult({this.upperDeviation, this.lowerDeviation, this.minSize, this.maxSize, this.restrictionKey, this.infoKey});
  

@override final  double? upperDeviation;
@override final  double? lowerDeviation;
@override final  double? minSize;
@override final  double? maxSize;
@override final  String? restrictionKey;
@override final  String? infoKey;

/// Create a copy of ToleranceResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToleranceResultCopyWith<_ToleranceResult> get copyWith => __$ToleranceResultCopyWithImpl<_ToleranceResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToleranceResult&&(identical(other.upperDeviation, upperDeviation) || other.upperDeviation == upperDeviation)&&(identical(other.lowerDeviation, lowerDeviation) || other.lowerDeviation == lowerDeviation)&&(identical(other.minSize, minSize) || other.minSize == minSize)&&(identical(other.maxSize, maxSize) || other.maxSize == maxSize)&&(identical(other.restrictionKey, restrictionKey) || other.restrictionKey == restrictionKey)&&(identical(other.infoKey, infoKey) || other.infoKey == infoKey));
}


@override
int get hashCode => Object.hash(runtimeType,upperDeviation,lowerDeviation,minSize,maxSize,restrictionKey,infoKey);

@override
String toString() {
  return 'ToleranceResult(upperDeviation: $upperDeviation, lowerDeviation: $lowerDeviation, minSize: $minSize, maxSize: $maxSize, restrictionKey: $restrictionKey, infoKey: $infoKey)';
}


}

/// @nodoc
abstract mixin class _$ToleranceResultCopyWith<$Res> implements $ToleranceResultCopyWith<$Res> {
  factory _$ToleranceResultCopyWith(_ToleranceResult value, $Res Function(_ToleranceResult) _then) = __$ToleranceResultCopyWithImpl;
@override @useResult
$Res call({
 double? upperDeviation, double? lowerDeviation, double? minSize, double? maxSize, String? restrictionKey, String? infoKey
});




}
/// @nodoc
class __$ToleranceResultCopyWithImpl<$Res>
    implements _$ToleranceResultCopyWith<$Res> {
  __$ToleranceResultCopyWithImpl(this._self, this._then);

  final _ToleranceResult _self;
  final $Res Function(_ToleranceResult) _then;

/// Create a copy of ToleranceResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upperDeviation = freezed,Object? lowerDeviation = freezed,Object? minSize = freezed,Object? maxSize = freezed,Object? restrictionKey = freezed,Object? infoKey = freezed,}) {
  return _then(_ToleranceResult(
upperDeviation: freezed == upperDeviation ? _self.upperDeviation : upperDeviation // ignore: cast_nullable_to_non_nullable
as double?,lowerDeviation: freezed == lowerDeviation ? _self.lowerDeviation : lowerDeviation // ignore: cast_nullable_to_non_nullable
as double?,minSize: freezed == minSize ? _self.minSize : minSize // ignore: cast_nullable_to_non_nullable
as double?,maxSize: freezed == maxSize ? _self.maxSize : maxSize // ignore: cast_nullable_to_non_nullable
as double?,restrictionKey: freezed == restrictionKey ? _self.restrictionKey : restrictionKey // ignore: cast_nullable_to_non_nullable
as String?,infoKey: freezed == infoKey ? _self.infoKey : infoKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
