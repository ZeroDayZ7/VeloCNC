// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadingState {

 IsoMaterialGroup? get selectedMaterial; IsoSubgroup? get selectedSubgroup; ThreadSize? get selectedThread; bool get isCutting; String get toolMaterial;
/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadingStateCopyWith<ThreadingState> get copyWith => _$ThreadingStateCopyWithImpl<ThreadingState>(this as ThreadingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadingState&&(identical(other.selectedMaterial, selectedMaterial) || other.selectedMaterial == selectedMaterial)&&(identical(other.selectedSubgroup, selectedSubgroup) || other.selectedSubgroup == selectedSubgroup)&&(identical(other.selectedThread, selectedThread) || other.selectedThread == selectedThread)&&(identical(other.isCutting, isCutting) || other.isCutting == isCutting)&&(identical(other.toolMaterial, toolMaterial) || other.toolMaterial == toolMaterial));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMaterial,selectedSubgroup,selectedThread,isCutting,toolMaterial);

@override
String toString() {
  return 'ThreadingState(selectedMaterial: $selectedMaterial, selectedSubgroup: $selectedSubgroup, selectedThread: $selectedThread, isCutting: $isCutting, toolMaterial: $toolMaterial)';
}


}

/// @nodoc
abstract mixin class $ThreadingStateCopyWith<$Res>  {
  factory $ThreadingStateCopyWith(ThreadingState value, $Res Function(ThreadingState) _then) = _$ThreadingStateCopyWithImpl;
@useResult
$Res call({
 IsoMaterialGroup? selectedMaterial, IsoSubgroup? selectedSubgroup, ThreadSize? selectedThread, bool isCutting, String toolMaterial
});


$IsoMaterialGroupCopyWith<$Res>? get selectedMaterial;$IsoSubgroupCopyWith<$Res>? get selectedSubgroup;$ThreadSizeCopyWith<$Res>? get selectedThread;

}
/// @nodoc
class _$ThreadingStateCopyWithImpl<$Res>
    implements $ThreadingStateCopyWith<$Res> {
  _$ThreadingStateCopyWithImpl(this._self, this._then);

  final ThreadingState _self;
  final $Res Function(ThreadingState) _then;

/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedMaterial = freezed,Object? selectedSubgroup = freezed,Object? selectedThread = freezed,Object? isCutting = null,Object? toolMaterial = null,}) {
  return _then(_self.copyWith(
selectedMaterial: freezed == selectedMaterial ? _self.selectedMaterial : selectedMaterial // ignore: cast_nullable_to_non_nullable
as IsoMaterialGroup?,selectedSubgroup: freezed == selectedSubgroup ? _self.selectedSubgroup : selectedSubgroup // ignore: cast_nullable_to_non_nullable
as IsoSubgroup?,selectedThread: freezed == selectedThread ? _self.selectedThread : selectedThread // ignore: cast_nullable_to_non_nullable
as ThreadSize?,isCutting: null == isCutting ? _self.isCutting : isCutting // ignore: cast_nullable_to_non_nullable
as bool,toolMaterial: null == toolMaterial ? _self.toolMaterial : toolMaterial // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsoMaterialGroupCopyWith<$Res>? get selectedMaterial {
    if (_self.selectedMaterial == null) {
    return null;
  }

  return $IsoMaterialGroupCopyWith<$Res>(_self.selectedMaterial!, (value) {
    return _then(_self.copyWith(selectedMaterial: value));
  });
}/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsoSubgroupCopyWith<$Res>? get selectedSubgroup {
    if (_self.selectedSubgroup == null) {
    return null;
  }

  return $IsoSubgroupCopyWith<$Res>(_self.selectedSubgroup!, (value) {
    return _then(_self.copyWith(selectedSubgroup: value));
  });
}/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadSizeCopyWith<$Res>? get selectedThread {
    if (_self.selectedThread == null) {
    return null;
  }

  return $ThreadSizeCopyWith<$Res>(_self.selectedThread!, (value) {
    return _then(_self.copyWith(selectedThread: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThreadingState].
extension ThreadingStatePatterns on ThreadingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreadingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreadingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreadingState value)  $default,){
final _that = this;
switch (_that) {
case _ThreadingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreadingState value)?  $default,){
final _that = this;
switch (_that) {
case _ThreadingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IsoMaterialGroup? selectedMaterial,  IsoSubgroup? selectedSubgroup,  ThreadSize? selectedThread,  bool isCutting,  String toolMaterial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreadingState() when $default != null:
return $default(_that.selectedMaterial,_that.selectedSubgroup,_that.selectedThread,_that.isCutting,_that.toolMaterial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IsoMaterialGroup? selectedMaterial,  IsoSubgroup? selectedSubgroup,  ThreadSize? selectedThread,  bool isCutting,  String toolMaterial)  $default,) {final _that = this;
switch (_that) {
case _ThreadingState():
return $default(_that.selectedMaterial,_that.selectedSubgroup,_that.selectedThread,_that.isCutting,_that.toolMaterial);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IsoMaterialGroup? selectedMaterial,  IsoSubgroup? selectedSubgroup,  ThreadSize? selectedThread,  bool isCutting,  String toolMaterial)?  $default,) {final _that = this;
switch (_that) {
case _ThreadingState() when $default != null:
return $default(_that.selectedMaterial,_that.selectedSubgroup,_that.selectedThread,_that.isCutting,_that.toolMaterial);case _:
  return null;

}
}

}

/// @nodoc


class _ThreadingState implements ThreadingState {
  const _ThreadingState({this.selectedMaterial, this.selectedSubgroup, this.selectedThread, this.isCutting = true, this.toolMaterial = 'VHM'});
  

@override final  IsoMaterialGroup? selectedMaterial;
@override final  IsoSubgroup? selectedSubgroup;
@override final  ThreadSize? selectedThread;
@override@JsonKey() final  bool isCutting;
@override@JsonKey() final  String toolMaterial;

/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadingStateCopyWith<_ThreadingState> get copyWith => __$ThreadingStateCopyWithImpl<_ThreadingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadingState&&(identical(other.selectedMaterial, selectedMaterial) || other.selectedMaterial == selectedMaterial)&&(identical(other.selectedSubgroup, selectedSubgroup) || other.selectedSubgroup == selectedSubgroup)&&(identical(other.selectedThread, selectedThread) || other.selectedThread == selectedThread)&&(identical(other.isCutting, isCutting) || other.isCutting == isCutting)&&(identical(other.toolMaterial, toolMaterial) || other.toolMaterial == toolMaterial));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMaterial,selectedSubgroup,selectedThread,isCutting,toolMaterial);

@override
String toString() {
  return 'ThreadingState(selectedMaterial: $selectedMaterial, selectedSubgroup: $selectedSubgroup, selectedThread: $selectedThread, isCutting: $isCutting, toolMaterial: $toolMaterial)';
}


}

/// @nodoc
abstract mixin class _$ThreadingStateCopyWith<$Res> implements $ThreadingStateCopyWith<$Res> {
  factory _$ThreadingStateCopyWith(_ThreadingState value, $Res Function(_ThreadingState) _then) = __$ThreadingStateCopyWithImpl;
@override @useResult
$Res call({
 IsoMaterialGroup? selectedMaterial, IsoSubgroup? selectedSubgroup, ThreadSize? selectedThread, bool isCutting, String toolMaterial
});


@override $IsoMaterialGroupCopyWith<$Res>? get selectedMaterial;@override $IsoSubgroupCopyWith<$Res>? get selectedSubgroup;@override $ThreadSizeCopyWith<$Res>? get selectedThread;

}
/// @nodoc
class __$ThreadingStateCopyWithImpl<$Res>
    implements _$ThreadingStateCopyWith<$Res> {
  __$ThreadingStateCopyWithImpl(this._self, this._then);

  final _ThreadingState _self;
  final $Res Function(_ThreadingState) _then;

/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedMaterial = freezed,Object? selectedSubgroup = freezed,Object? selectedThread = freezed,Object? isCutting = null,Object? toolMaterial = null,}) {
  return _then(_ThreadingState(
selectedMaterial: freezed == selectedMaterial ? _self.selectedMaterial : selectedMaterial // ignore: cast_nullable_to_non_nullable
as IsoMaterialGroup?,selectedSubgroup: freezed == selectedSubgroup ? _self.selectedSubgroup : selectedSubgroup // ignore: cast_nullable_to_non_nullable
as IsoSubgroup?,selectedThread: freezed == selectedThread ? _self.selectedThread : selectedThread // ignore: cast_nullable_to_non_nullable
as ThreadSize?,isCutting: null == isCutting ? _self.isCutting : isCutting // ignore: cast_nullable_to_non_nullable
as bool,toolMaterial: null == toolMaterial ? _self.toolMaterial : toolMaterial // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsoMaterialGroupCopyWith<$Res>? get selectedMaterial {
    if (_self.selectedMaterial == null) {
    return null;
  }

  return $IsoMaterialGroupCopyWith<$Res>(_self.selectedMaterial!, (value) {
    return _then(_self.copyWith(selectedMaterial: value));
  });
}/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsoSubgroupCopyWith<$Res>? get selectedSubgroup {
    if (_self.selectedSubgroup == null) {
    return null;
  }

  return $IsoSubgroupCopyWith<$Res>(_self.selectedSubgroup!, (value) {
    return _then(_self.copyWith(selectedSubgroup: value));
  });
}/// Create a copy of ThreadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadSizeCopyWith<$Res>? get selectedThread {
    if (_self.selectedThread == null) {
    return null;
  }

  return $ThreadSizeCopyWith<$Res>(_self.selectedThread!, (value) {
    return _then(_self.copyWith(selectedThread: value));
  });
}
}

// dart format on
