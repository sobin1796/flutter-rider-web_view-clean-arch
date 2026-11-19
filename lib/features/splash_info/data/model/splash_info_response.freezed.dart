// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashInfoResponse {

 int? get id; String? get title;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'duration_seconds') int? get durationSeconds;@JsonKey(name: 'is_active') bool? get isActive;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of SplashInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashInfoResponseCopyWith<SplashInfoResponse> get copyWith => _$SplashInfoResponseCopyWithImpl<SplashInfoResponse>(this as SplashInfoResponse, _$identity);

  /// Serializes this SplashInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashInfoResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,durationSeconds,isActive,updatedAt);

@override
String toString() {
  return 'SplashInfoResponse(id: $id, title: $title, imageUrl: $imageUrl, durationSeconds: $durationSeconds, isActive: $isActive, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SplashInfoResponseCopyWith<$Res>  {
  factory $SplashInfoResponseCopyWith(SplashInfoResponse value, $Res Function(SplashInfoResponse) _then) = _$SplashInfoResponseCopyWithImpl;
@useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$SplashInfoResponseCopyWithImpl<$Res>
    implements $SplashInfoResponseCopyWith<$Res> {
  _$SplashInfoResponseCopyWithImpl(this._self, this._then);

  final SplashInfoResponse _self;
  final $Res Function(SplashInfoResponse) _then;

/// Create a copy of SplashInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? imageUrl = freezed,Object? durationSeconds = freezed,Object? isActive = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashInfoResponse].
extension SplashInfoResponsePatterns on SplashInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _SplashInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SplashInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashInfoResponse() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.durationSeconds,_that.isActive,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SplashInfoResponse():
return $default(_that.id,_that.title,_that.imageUrl,_that.durationSeconds,_that.isActive,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'duration_seconds')  int? durationSeconds, @JsonKey(name: 'is_active')  bool? isActive, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SplashInfoResponse() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.durationSeconds,_that.isActive,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashInfoResponse implements SplashInfoResponse {
  const _SplashInfoResponse({this.id, this.title, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'duration_seconds') this.durationSeconds, @JsonKey(name: 'is_active') this.isActive, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _SplashInfoResponse.fromJson(Map<String, dynamic> json) => _$SplashInfoResponseFromJson(json);

@override final  int? id;
@override final  String? title;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'duration_seconds') final  int? durationSeconds;
@override@JsonKey(name: 'is_active') final  bool? isActive;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of SplashInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashInfoResponseCopyWith<_SplashInfoResponse> get copyWith => __$SplashInfoResponseCopyWithImpl<_SplashInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashInfoResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,durationSeconds,isActive,updatedAt);

@override
String toString() {
  return 'SplashInfoResponse(id: $id, title: $title, imageUrl: $imageUrl, durationSeconds: $durationSeconds, isActive: $isActive, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SplashInfoResponseCopyWith<$Res> implements $SplashInfoResponseCopyWith<$Res> {
  factory _$SplashInfoResponseCopyWith(_SplashInfoResponse value, $Res Function(_SplashInfoResponse) _then) = __$SplashInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'duration_seconds') int? durationSeconds,@JsonKey(name: 'is_active') bool? isActive,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$SplashInfoResponseCopyWithImpl<$Res>
    implements _$SplashInfoResponseCopyWith<$Res> {
  __$SplashInfoResponseCopyWithImpl(this._self, this._then);

  final _SplashInfoResponse _self;
  final $Res Function(_SplashInfoResponse) _then;

/// Create a copy of SplashInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? imageUrl = freezed,Object? durationSeconds = freezed,Object? isActive = freezed,Object? updatedAt = freezed,}) {
  return _then(_SplashInfoResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
