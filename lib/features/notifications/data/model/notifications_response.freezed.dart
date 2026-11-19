// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationResponse {

@JsonKey(fromJson: _toInt) int? get unread_count; List<AppNotification>? get data;
/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationResponseCopyWith<NotificationResponse> get copyWith => _$NotificationResponseCopyWithImpl<NotificationResponse>(this as NotificationResponse, _$identity);

  /// Serializes this NotificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationResponse&&(identical(other.unread_count, unread_count) || other.unread_count == unread_count)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unread_count,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'NotificationResponse(unread_count: $unread_count, data: $data)';
}


}

/// @nodoc
abstract mixin class $NotificationResponseCopyWith<$Res>  {
  factory $NotificationResponseCopyWith(NotificationResponse value, $Res Function(NotificationResponse) _then) = _$NotificationResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int? unread_count, List<AppNotification>? data
});




}
/// @nodoc
class _$NotificationResponseCopyWithImpl<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  _$NotificationResponseCopyWithImpl(this._self, this._then);

  final NotificationResponse _self;
  final $Res Function(NotificationResponse) _then;

/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unread_count = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
unread_count: freezed == unread_count ? _self.unread_count : unread_count // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AppNotification>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationResponse].
extension NotificationResponsePatterns on NotificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int? unread_count,  List<AppNotification>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
return $default(_that.unread_count,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int? unread_count,  List<AppNotification>? data)  $default,) {final _that = this;
switch (_that) {
case _NotificationResponse():
return $default(_that.unread_count,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int? unread_count,  List<AppNotification>? data)?  $default,) {final _that = this;
switch (_that) {
case _NotificationResponse() when $default != null:
return $default(_that.unread_count,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationResponse implements NotificationResponse {
  const _NotificationResponse({@JsonKey(fromJson: _toInt) this.unread_count, final  List<AppNotification>? data}): _data = data;
  factory _NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int? unread_count;
 final  List<AppNotification>? _data;
@override List<AppNotification>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationResponseCopyWith<_NotificationResponse> get copyWith => __$NotificationResponseCopyWithImpl<_NotificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationResponse&&(identical(other.unread_count, unread_count) || other.unread_count == unread_count)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unread_count,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'NotificationResponse(unread_count: $unread_count, data: $data)';
}


}

/// @nodoc
abstract mixin class _$NotificationResponseCopyWith<$Res> implements $NotificationResponseCopyWith<$Res> {
  factory _$NotificationResponseCopyWith(_NotificationResponse value, $Res Function(_NotificationResponse) _then) = __$NotificationResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int? unread_count, List<AppNotification>? data
});




}
/// @nodoc
class __$NotificationResponseCopyWithImpl<$Res>
    implements _$NotificationResponseCopyWith<$Res> {
  __$NotificationResponseCopyWithImpl(this._self, this._then);

  final _NotificationResponse _self;
  final $Res Function(_NotificationResponse) _then;

/// Create a copy of NotificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unread_count = freezed,Object? data = freezed,}) {
  return _then(_NotificationResponse(
unread_count: freezed == unread_count ? _self.unread_count : unread_count // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AppNotification>?,
  ));
}


}


/// @nodoc
mixin _$AppNotification {

@JsonKey(fromJson: _toInt) int? get id; String? get title; String? get body; String? get type; String? get target; String? get href; String? get what; String? get entity; String? get order_number; String? get store_name; String? get store_logo; String? get product_image; String? get status; String? get entity_type;@JsonKey(fromJson: _toString) String? get entity_id; bool? get is_read; DateTime? get sent_at; DateTime? get created_at;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.target, target) || other.target == target)&&(identical(other.href, href) || other.href == href)&&(identical(other.what, what) || other.what == what)&&(identical(other.entity, entity) || other.entity == entity)&&(identical(other.order_number, order_number) || other.order_number == order_number)&&(identical(other.store_name, store_name) || other.store_name == store_name)&&(identical(other.store_logo, store_logo) || other.store_logo == store_logo)&&(identical(other.product_image, product_image) || other.product_image == product_image)&&(identical(other.status, status) || other.status == status)&&(identical(other.entity_type, entity_type) || other.entity_type == entity_type)&&(identical(other.entity_id, entity_id) || other.entity_id == entity_id)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&(identical(other.sent_at, sent_at) || other.sent_at == sent_at)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,type,target,href,what,entity,order_number,store_name,store_logo,product_image,status,entity_type,entity_id,is_read,sent_at,created_at);

@override
String toString() {
  return 'AppNotification(id: $id, title: $title, body: $body, type: $type, target: $target, href: $href, what: $what, entity: $entity, order_number: $order_number, store_name: $store_name, store_logo: $store_logo, product_image: $product_image, status: $status, entity_type: $entity_type, entity_id: $entity_id, is_read: $is_read, sent_at: $sent_at, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _toInt) int? id, String? title, String? body, String? type, String? target, String? href, String? what, String? entity, String? order_number, String? store_name, String? store_logo, String? product_image, String? status, String? entity_type,@JsonKey(fromJson: _toString) String? entity_id, bool? is_read, DateTime? sent_at, DateTime? created_at
});




}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? body = freezed,Object? type = freezed,Object? target = freezed,Object? href = freezed,Object? what = freezed,Object? entity = freezed,Object? order_number = freezed,Object? store_name = freezed,Object? store_logo = freezed,Object? product_image = freezed,Object? status = freezed,Object? entity_type = freezed,Object? entity_id = freezed,Object? is_read = freezed,Object? sent_at = freezed,Object? created_at = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,what: freezed == what ? _self.what : what // ignore: cast_nullable_to_non_nullable
as String?,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as String?,order_number: freezed == order_number ? _self.order_number : order_number // ignore: cast_nullable_to_non_nullable
as String?,store_name: freezed == store_name ? _self.store_name : store_name // ignore: cast_nullable_to_non_nullable
as String?,store_logo: freezed == store_logo ? _self.store_logo : store_logo // ignore: cast_nullable_to_non_nullable
as String?,product_image: freezed == product_image ? _self.product_image : product_image // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,entity_type: freezed == entity_type ? _self.entity_type : entity_type // ignore: cast_nullable_to_non_nullable
as String?,entity_id: freezed == entity_id ? _self.entity_id : entity_id // ignore: cast_nullable_to_non_nullable
as String?,is_read: freezed == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool?,sent_at: freezed == sent_at ? _self.sent_at : sent_at // ignore: cast_nullable_to_non_nullable
as DateTime?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int? id,  String? title,  String? body,  String? type,  String? target,  String? href,  String? what,  String? entity,  String? order_number,  String? store_name,  String? store_logo,  String? product_image,  String? status,  String? entity_type, @JsonKey(fromJson: _toString)  String? entity_id,  bool? is_read,  DateTime? sent_at,  DateTime? created_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.type,_that.target,_that.href,_that.what,_that.entity,_that.order_number,_that.store_name,_that.store_logo,_that.product_image,_that.status,_that.entity_type,_that.entity_id,_that.is_read,_that.sent_at,_that.created_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _toInt)  int? id,  String? title,  String? body,  String? type,  String? target,  String? href,  String? what,  String? entity,  String? order_number,  String? store_name,  String? store_logo,  String? product_image,  String? status,  String? entity_type, @JsonKey(fromJson: _toString)  String? entity_id,  bool? is_read,  DateTime? sent_at,  DateTime? created_at)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that.id,_that.title,_that.body,_that.type,_that.target,_that.href,_that.what,_that.entity,_that.order_number,_that.store_name,_that.store_logo,_that.product_image,_that.status,_that.entity_type,_that.entity_id,_that.is_read,_that.sent_at,_that.created_at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _toInt)  int? id,  String? title,  String? body,  String? type,  String? target,  String? href,  String? what,  String? entity,  String? order_number,  String? store_name,  String? store_logo,  String? product_image,  String? status,  String? entity_type, @JsonKey(fromJson: _toString)  String? entity_id,  bool? is_read,  DateTime? sent_at,  DateTime? created_at)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.type,_that.target,_that.href,_that.what,_that.entity,_that.order_number,_that.store_name,_that.store_logo,_that.product_image,_that.status,_that.entity_type,_that.entity_id,_that.is_read,_that.sent_at,_that.created_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotification implements AppNotification {
  const _AppNotification({@JsonKey(fromJson: _toInt) this.id, this.title, this.body, this.type, this.target, this.href, this.what, this.entity, this.order_number, this.store_name, this.store_logo, this.product_image, this.status, this.entity_type, @JsonKey(fromJson: _toString) this.entity_id, this.is_read, this.sent_at, this.created_at});
  factory _AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

@override@JsonKey(fromJson: _toInt) final  int? id;
@override final  String? title;
@override final  String? body;
@override final  String? type;
@override final  String? target;
@override final  String? href;
@override final  String? what;
@override final  String? entity;
@override final  String? order_number;
@override final  String? store_name;
@override final  String? store_logo;
@override final  String? product_image;
@override final  String? status;
@override final  String? entity_type;
@override@JsonKey(fromJson: _toString) final  String? entity_id;
@override final  bool? is_read;
@override final  DateTime? sent_at;
@override final  DateTime? created_at;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.type, type) || other.type == type)&&(identical(other.target, target) || other.target == target)&&(identical(other.href, href) || other.href == href)&&(identical(other.what, what) || other.what == what)&&(identical(other.entity, entity) || other.entity == entity)&&(identical(other.order_number, order_number) || other.order_number == order_number)&&(identical(other.store_name, store_name) || other.store_name == store_name)&&(identical(other.store_logo, store_logo) || other.store_logo == store_logo)&&(identical(other.product_image, product_image) || other.product_image == product_image)&&(identical(other.status, status) || other.status == status)&&(identical(other.entity_type, entity_type) || other.entity_type == entity_type)&&(identical(other.entity_id, entity_id) || other.entity_id == entity_id)&&(identical(other.is_read, is_read) || other.is_read == is_read)&&(identical(other.sent_at, sent_at) || other.sent_at == sent_at)&&(identical(other.created_at, created_at) || other.created_at == created_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,type,target,href,what,entity,order_number,store_name,store_logo,product_image,status,entity_type,entity_id,is_read,sent_at,created_at);

@override
String toString() {
  return 'AppNotification(id: $id, title: $title, body: $body, type: $type, target: $target, href: $href, what: $what, entity: $entity, order_number: $order_number, store_name: $store_name, store_logo: $store_logo, product_image: $product_image, status: $status, entity_type: $entity_type, entity_id: $entity_id, is_read: $is_read, sent_at: $sent_at, created_at: $created_at)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _toInt) int? id, String? title, String? body, String? type, String? target, String? href, String? what, String? entity, String? order_number, String? store_name, String? store_logo, String? product_image, String? status, String? entity_type,@JsonKey(fromJson: _toString) String? entity_id, bool? is_read, DateTime? sent_at, DateTime? created_at
});




}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? body = freezed,Object? type = freezed,Object? target = freezed,Object? href = freezed,Object? what = freezed,Object? entity = freezed,Object? order_number = freezed,Object? store_name = freezed,Object? store_logo = freezed,Object? product_image = freezed,Object? status = freezed,Object? entity_type = freezed,Object? entity_id = freezed,Object? is_read = freezed,Object? sent_at = freezed,Object? created_at = freezed,}) {
  return _then(_AppNotification(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,what: freezed == what ? _self.what : what // ignore: cast_nullable_to_non_nullable
as String?,entity: freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as String?,order_number: freezed == order_number ? _self.order_number : order_number // ignore: cast_nullable_to_non_nullable
as String?,store_name: freezed == store_name ? _self.store_name : store_name // ignore: cast_nullable_to_non_nullable
as String?,store_logo: freezed == store_logo ? _self.store_logo : store_logo // ignore: cast_nullable_to_non_nullable
as String?,product_image: freezed == product_image ? _self.product_image : product_image // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,entity_type: freezed == entity_type ? _self.entity_type : entity_type // ignore: cast_nullable_to_non_nullable
as String?,entity_id: freezed == entity_id ? _self.entity_id : entity_id // ignore: cast_nullable_to_non_nullable
as String?,is_read: freezed == is_read ? _self.is_read : is_read // ignore: cast_nullable_to_non_nullable
as bool?,sent_at: freezed == sent_at ? _self.sent_at : sent_at // ignore: cast_nullable_to_non_nullable
as DateTime?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
