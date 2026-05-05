// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PredictionEntity {

 String get label; double get score;
/// Create a copy of PredictionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PredictionEntityCopyWith<PredictionEntity> get copyWith => _$PredictionEntityCopyWithImpl<PredictionEntity>(this as PredictionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PredictionEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,label,score);

@override
String toString() {
  return 'PredictionEntity(label: $label, score: $score)';
}


}

/// @nodoc
abstract mixin class $PredictionEntityCopyWith<$Res>  {
  factory $PredictionEntityCopyWith(PredictionEntity value, $Res Function(PredictionEntity) _then) = _$PredictionEntityCopyWithImpl;
@useResult
$Res call({
 String label, double score
});




}
/// @nodoc
class _$PredictionEntityCopyWithImpl<$Res>
    implements $PredictionEntityCopyWith<$Res> {
  _$PredictionEntityCopyWithImpl(this._self, this._then);

  final PredictionEntity _self;
  final $Res Function(PredictionEntity) _then;

/// Create a copy of PredictionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? score = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PredictionEntity].
extension PredictionEntityPatterns on PredictionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PredictionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PredictionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PredictionEntity value)  $default,){
final _that = this;
switch (_that) {
case _PredictionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PredictionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PredictionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PredictionEntity() when $default != null:
return $default(_that.label,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double score)  $default,) {final _that = this;
switch (_that) {
case _PredictionEntity():
return $default(_that.label,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double score)?  $default,) {final _that = this;
switch (_that) {
case _PredictionEntity() when $default != null:
return $default(_that.label,_that.score);case _:
  return null;

}
}

}

/// @nodoc


class _PredictionEntity implements PredictionEntity {
   _PredictionEntity({required this.label, required this.score});
  

@override final  String label;
@override final  double score;

/// Create a copy of PredictionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PredictionEntityCopyWith<_PredictionEntity> get copyWith => __$PredictionEntityCopyWithImpl<_PredictionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PredictionEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,label,score);

@override
String toString() {
  return 'PredictionEntity(label: $label, score: $score)';
}


}

/// @nodoc
abstract mixin class _$PredictionEntityCopyWith<$Res> implements $PredictionEntityCopyWith<$Res> {
  factory _$PredictionEntityCopyWith(_PredictionEntity value, $Res Function(_PredictionEntity) _then) = __$PredictionEntityCopyWithImpl;
@override @useResult
$Res call({
 String label, double score
});




}
/// @nodoc
class __$PredictionEntityCopyWithImpl<$Res>
    implements _$PredictionEntityCopyWith<$Res> {
  __$PredictionEntityCopyWithImpl(this._self, this._then);

  final _PredictionEntity _self;
  final $Res Function(_PredictionEntity) _then;

/// Create a copy of PredictionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? score = null,}) {
  return _then(_PredictionEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$AudioResultsEntity {

 int get id; String? get createdAt; List<PredictionEntity> get predictions;
/// Create a copy of AudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioResultsEntityCopyWith<AudioResultsEntity> get copyWith => _$AudioResultsEntityCopyWithImpl<AudioResultsEntity>(this as AudioResultsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioResultsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.predictions, predictions));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(predictions));

@override
String toString() {
  return 'AudioResultsEntity(id: $id, createdAt: $createdAt, predictions: $predictions)';
}


}

/// @nodoc
abstract mixin class $AudioResultsEntityCopyWith<$Res>  {
  factory $AudioResultsEntityCopyWith(AudioResultsEntity value, $Res Function(AudioResultsEntity) _then) = _$AudioResultsEntityCopyWithImpl;
@useResult
$Res call({
 int id, String? createdAt, List<PredictionEntity> predictions
});




}
/// @nodoc
class _$AudioResultsEntityCopyWithImpl<$Res>
    implements $AudioResultsEntityCopyWith<$Res> {
  _$AudioResultsEntityCopyWithImpl(this._self, this._then);

  final AudioResultsEntity _self;
  final $Res Function(AudioResultsEntity) _then;

/// Create a copy of AudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? predictions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,predictions: null == predictions ? _self.predictions : predictions // ignore: cast_nullable_to_non_nullable
as List<PredictionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioResultsEntity].
extension AudioResultsEntityPatterns on AudioResultsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioResultsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioResultsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioResultsEntity value)  $default,){
final _that = this;
switch (_that) {
case _AudioResultsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioResultsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AudioResultsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? createdAt,  List<PredictionEntity> predictions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioResultsEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.predictions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? createdAt,  List<PredictionEntity> predictions)  $default,) {final _that = this;
switch (_that) {
case _AudioResultsEntity():
return $default(_that.id,_that.createdAt,_that.predictions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? createdAt,  List<PredictionEntity> predictions)?  $default,) {final _that = this;
switch (_that) {
case _AudioResultsEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.predictions);case _:
  return null;

}
}

}

/// @nodoc


class _AudioResultsEntity implements AudioResultsEntity {
   _AudioResultsEntity({required this.id, this.createdAt, required final  List<PredictionEntity> predictions}): _predictions = predictions;
  

@override final  int id;
@override final  String? createdAt;
 final  List<PredictionEntity> _predictions;
@override List<PredictionEntity> get predictions {
  if (_predictions is EqualUnmodifiableListView) return _predictions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_predictions);
}


/// Create a copy of AudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioResultsEntityCopyWith<_AudioResultsEntity> get copyWith => __$AudioResultsEntityCopyWithImpl<_AudioResultsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioResultsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._predictions, _predictions));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(_predictions));

@override
String toString() {
  return 'AudioResultsEntity(id: $id, createdAt: $createdAt, predictions: $predictions)';
}


}

/// @nodoc
abstract mixin class _$AudioResultsEntityCopyWith<$Res> implements $AudioResultsEntityCopyWith<$Res> {
  factory _$AudioResultsEntityCopyWith(_AudioResultsEntity value, $Res Function(_AudioResultsEntity) _then) = __$AudioResultsEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String? createdAt, List<PredictionEntity> predictions
});




}
/// @nodoc
class __$AudioResultsEntityCopyWithImpl<$Res>
    implements _$AudioResultsEntityCopyWith<$Res> {
  __$AudioResultsEntityCopyWithImpl(this._self, this._then);

  final _AudioResultsEntity _self;
  final $Res Function(_AudioResultsEntity) _then;

/// Create a copy of AudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? predictions = null,}) {
  return _then(_AudioResultsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,predictions: null == predictions ? _self._predictions : predictions // ignore: cast_nullable_to_non_nullable
as List<PredictionEntity>,
  ));
}


}

/// @nodoc
mixin _$ListAudioResultsEntity {

 int get page; List<AudioResultsEntity> get items;
/// Create a copy of ListAudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListAudioResultsEntityCopyWith<ListAudioResultsEntity> get copyWith => _$ListAudioResultsEntityCopyWithImpl<ListAudioResultsEntity>(this as ListAudioResultsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListAudioResultsEntity&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListAudioResultsEntity(page: $page, items: $items)';
}


}

/// @nodoc
abstract mixin class $ListAudioResultsEntityCopyWith<$Res>  {
  factory $ListAudioResultsEntityCopyWith(ListAudioResultsEntity value, $Res Function(ListAudioResultsEntity) _then) = _$ListAudioResultsEntityCopyWithImpl;
@useResult
$Res call({
 int page, List<AudioResultsEntity> items
});




}
/// @nodoc
class _$ListAudioResultsEntityCopyWithImpl<$Res>
    implements $ListAudioResultsEntityCopyWith<$Res> {
  _$ListAudioResultsEntityCopyWithImpl(this._self, this._then);

  final ListAudioResultsEntity _self;
  final $Res Function(ListAudioResultsEntity) _then;

/// Create a copy of ListAudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? items = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AudioResultsEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListAudioResultsEntity].
extension ListAudioResultsEntityPatterns on ListAudioResultsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListAudioResultsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListAudioResultsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListAudioResultsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ListAudioResultsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListAudioResultsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ListAudioResultsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  List<AudioResultsEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListAudioResultsEntity() when $default != null:
return $default(_that.page,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  List<AudioResultsEntity> items)  $default,) {final _that = this;
switch (_that) {
case _ListAudioResultsEntity():
return $default(_that.page,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  List<AudioResultsEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _ListAudioResultsEntity() when $default != null:
return $default(_that.page,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _ListAudioResultsEntity implements ListAudioResultsEntity {
   _ListAudioResultsEntity({required this.page, required final  List<AudioResultsEntity> items}): _items = items;
  

@override final  int page;
 final  List<AudioResultsEntity> _items;
@override List<AudioResultsEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListAudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListAudioResultsEntityCopyWith<_ListAudioResultsEntity> get copyWith => __$ListAudioResultsEntityCopyWithImpl<_ListAudioResultsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListAudioResultsEntity&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListAudioResultsEntity(page: $page, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListAudioResultsEntityCopyWith<$Res> implements $ListAudioResultsEntityCopyWith<$Res> {
  factory _$ListAudioResultsEntityCopyWith(_ListAudioResultsEntity value, $Res Function(_ListAudioResultsEntity) _then) = __$ListAudioResultsEntityCopyWithImpl;
@override @useResult
$Res call({
 int page, List<AudioResultsEntity> items
});




}
/// @nodoc
class __$ListAudioResultsEntityCopyWithImpl<$Res>
    implements _$ListAudioResultsEntityCopyWith<$Res> {
  __$ListAudioResultsEntityCopyWithImpl(this._self, this._then);

  final _ListAudioResultsEntity _self;
  final $Res Function(_ListAudioResultsEntity) _then;

/// Create a copy of ListAudioResultsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? items = null,}) {
  return _then(_ListAudioResultsEntity(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AudioResultsEntity>,
  ));
}


}

// dart format on
