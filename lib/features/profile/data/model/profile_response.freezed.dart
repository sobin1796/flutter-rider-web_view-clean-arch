// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResponse {

 int? get id; String? get name; String? get email; String? get phone; String? get date_of_birth; String? get avatar; String? get pan; int? get followers_count; int? get marks_count; int? get films_count; String? get creator_status; bool? get is_active; bool? get is_creator; String? get created_at; List<dynamic> get addresses; dynamic get default_address;
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<ProfileResponse> get copyWith => _$ProfileResponseCopyWithImpl<ProfileResponse>(this as ProfileResponse, _$identity);

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.pan, pan) || other.pan == pan)&&(identical(other.followers_count, followers_count) || other.followers_count == followers_count)&&(identical(other.marks_count, marks_count) || other.marks_count == marks_count)&&(identical(other.films_count, films_count) || other.films_count == films_count)&&(identical(other.creator_status, creator_status) || other.creator_status == creator_status)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.is_creator, is_creator) || other.is_creator == is_creator)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&const DeepCollectionEquality().equals(other.default_address, default_address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,date_of_birth,avatar,pan,followers_count,marks_count,films_count,creator_status,is_active,is_creator,created_at,const DeepCollectionEquality().hash(addresses),const DeepCollectionEquality().hash(default_address));

@override
String toString() {
  return 'ProfileResponse(id: $id, name: $name, email: $email, phone: $phone, date_of_birth: $date_of_birth, avatar: $avatar, pan: $pan, followers_count: $followers_count, marks_count: $marks_count, films_count: $films_count, creator_status: $creator_status, is_active: $is_active, is_creator: $is_creator, created_at: $created_at, addresses: $addresses, default_address: $default_address)';
}


}

/// @nodoc
abstract mixin class $ProfileResponseCopyWith<$Res>  {
  factory $ProfileResponseCopyWith(ProfileResponse value, $Res Function(ProfileResponse) _then) = _$ProfileResponseCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? email, String? phone, String? date_of_birth, String? avatar, String? pan, int? followers_count, int? marks_count, int? films_count, String? creator_status, bool? is_active, bool? is_creator, String? created_at, List<dynamic> addresses, dynamic default_address
});




}
/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._self, this._then);

  final ProfileResponse _self;
  final $Res Function(ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? date_of_birth = freezed,Object? avatar = freezed,Object? pan = freezed,Object? followers_count = freezed,Object? marks_count = freezed,Object? films_count = freezed,Object? creator_status = freezed,Object? is_active = freezed,Object? is_creator = freezed,Object? created_at = freezed,Object? addresses = null,Object? default_address = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,date_of_birth: freezed == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,pan: freezed == pan ? _self.pan : pan // ignore: cast_nullable_to_non_nullable
as String?,followers_count: freezed == followers_count ? _self.followers_count : followers_count // ignore: cast_nullable_to_non_nullable
as int?,marks_count: freezed == marks_count ? _self.marks_count : marks_count // ignore: cast_nullable_to_non_nullable
as int?,films_count: freezed == films_count ? _self.films_count : films_count // ignore: cast_nullable_to_non_nullable
as int?,creator_status: freezed == creator_status ? _self.creator_status : creator_status // ignore: cast_nullable_to_non_nullable
as String?,is_active: freezed == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool?,is_creator: freezed == is_creator ? _self.is_creator : is_creator // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<dynamic>,default_address: freezed == default_address ? _self.default_address : default_address // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileResponse].
extension ProfileResponsePatterns on ProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? phone,  String? date_of_birth,  String? avatar,  String? pan,  int? followers_count,  int? marks_count,  int? films_count,  String? creator_status,  bool? is_active,  bool? is_creator,  String? created_at,  List<dynamic> addresses,  dynamic default_address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.date_of_birth,_that.avatar,_that.pan,_that.followers_count,_that.marks_count,_that.films_count,_that.creator_status,_that.is_active,_that.is_creator,_that.created_at,_that.addresses,_that.default_address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? phone,  String? date_of_birth,  String? avatar,  String? pan,  int? followers_count,  int? marks_count,  int? films_count,  String? creator_status,  bool? is_active,  bool? is_creator,  String? created_at,  List<dynamic> addresses,  dynamic default_address)  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.date_of_birth,_that.avatar,_that.pan,_that.followers_count,_that.marks_count,_that.films_count,_that.creator_status,_that.is_active,_that.is_creator,_that.created_at,_that.addresses,_that.default_address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? email,  String? phone,  String? date_of_birth,  String? avatar,  String? pan,  int? followers_count,  int? marks_count,  int? films_count,  String? creator_status,  bool? is_active,  bool? is_creator,  String? created_at,  List<dynamic> addresses,  dynamic default_address)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.date_of_birth,_that.avatar,_that.pan,_that.followers_count,_that.marks_count,_that.films_count,_that.creator_status,_that.is_active,_that.is_creator,_that.created_at,_that.addresses,_that.default_address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResponse implements ProfileResponse {
  const _ProfileResponse({this.id, this.name, this.email, this.phone, this.date_of_birth, this.avatar, this.pan, this.followers_count, this.marks_count, this.films_count, this.creator_status, this.is_active, this.is_creator, this.created_at, final  List<dynamic> addresses = const [], this.default_address}): _addresses = addresses;
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String? date_of_birth;
@override final  String? avatar;
@override final  String? pan;
@override final  int? followers_count;
@override final  int? marks_count;
@override final  int? films_count;
@override final  String? creator_status;
@override final  bool? is_active;
@override final  bool? is_creator;
@override final  String? created_at;
 final  List<dynamic> _addresses;
@override@JsonKey() List<dynamic> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override final  dynamic default_address;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResponseCopyWith<_ProfileResponse> get copyWith => __$ProfileResponseCopyWithImpl<_ProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.pan, pan) || other.pan == pan)&&(identical(other.followers_count, followers_count) || other.followers_count == followers_count)&&(identical(other.marks_count, marks_count) || other.marks_count == marks_count)&&(identical(other.films_count, films_count) || other.films_count == films_count)&&(identical(other.creator_status, creator_status) || other.creator_status == creator_status)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.is_creator, is_creator) || other.is_creator == is_creator)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&const DeepCollectionEquality().equals(other.default_address, default_address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,date_of_birth,avatar,pan,followers_count,marks_count,films_count,creator_status,is_active,is_creator,created_at,const DeepCollectionEquality().hash(_addresses),const DeepCollectionEquality().hash(default_address));

@override
String toString() {
  return 'ProfileResponse(id: $id, name: $name, email: $email, phone: $phone, date_of_birth: $date_of_birth, avatar: $avatar, pan: $pan, followers_count: $followers_count, marks_count: $marks_count, films_count: $films_count, creator_status: $creator_status, is_active: $is_active, is_creator: $is_creator, created_at: $created_at, addresses: $addresses, default_address: $default_address)';
}


}

/// @nodoc
abstract mixin class _$ProfileResponseCopyWith<$Res> implements $ProfileResponseCopyWith<$Res> {
  factory _$ProfileResponseCopyWith(_ProfileResponse value, $Res Function(_ProfileResponse) _then) = __$ProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? email, String? phone, String? date_of_birth, String? avatar, String? pan, int? followers_count, int? marks_count, int? films_count, String? creator_status, bool? is_active, bool? is_creator, String? created_at, List<dynamic> addresses, dynamic default_address
});




}
/// @nodoc
class __$ProfileResponseCopyWithImpl<$Res>
    implements _$ProfileResponseCopyWith<$Res> {
  __$ProfileResponseCopyWithImpl(this._self, this._then);

  final _ProfileResponse _self;
  final $Res Function(_ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? date_of_birth = freezed,Object? avatar = freezed,Object? pan = freezed,Object? followers_count = freezed,Object? marks_count = freezed,Object? films_count = freezed,Object? creator_status = freezed,Object? is_active = freezed,Object? is_creator = freezed,Object? created_at = freezed,Object? addresses = null,Object? default_address = freezed,}) {
  return _then(_ProfileResponse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,date_of_birth: freezed == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,pan: freezed == pan ? _self.pan : pan // ignore: cast_nullable_to_non_nullable
as String?,followers_count: freezed == followers_count ? _self.followers_count : followers_count // ignore: cast_nullable_to_non_nullable
as int?,marks_count: freezed == marks_count ? _self.marks_count : marks_count // ignore: cast_nullable_to_non_nullable
as int?,films_count: freezed == films_count ? _self.films_count : films_count // ignore: cast_nullable_to_non_nullable
as int?,creator_status: freezed == creator_status ? _self.creator_status : creator_status // ignore: cast_nullable_to_non_nullable
as String?,is_active: freezed == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool?,is_creator: freezed == is_creator ? _self.is_creator : is_creator // ignore: cast_nullable_to_non_nullable
as bool?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<dynamic>,default_address: freezed == default_address ? _self.default_address : default_address // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
