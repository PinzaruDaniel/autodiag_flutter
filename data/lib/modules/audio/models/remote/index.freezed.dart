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
mixin _$AudioResultsApiDto {

@JsonKey(name: 'result_id') int get id;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'predictions', readValue: _readPredictions) List<PredictionsApiDto> get predictions;
/// Create a copy of AudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioResultsApiDtoCopyWith<AudioResultsApiDto> get copyWith => _$AudioResultsApiDtoCopyWithImpl<AudioResultsApiDto>(this as AudioResultsApiDto, _$identity);

  /// Serializes this AudioResultsApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioResultsApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.predictions, predictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(predictions));

@override
String toString() {
  return 'AudioResultsApiDto(id: $id, createdAt: $createdAt, predictions: $predictions)';
}


}

/// @nodoc
abstract mixin class $AudioResultsApiDtoCopyWith<$Res>  {
  factory $AudioResultsApiDtoCopyWith(AudioResultsApiDto value, $Res Function(AudioResultsApiDto) _then) = _$AudioResultsApiDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'result_id') int id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'predictions', readValue: _readPredictions) List<PredictionsApiDto> predictions
});




}
/// @nodoc
class _$AudioResultsApiDtoCopyWithImpl<$Res>
    implements $AudioResultsApiDtoCopyWith<$Res> {
  _$AudioResultsApiDtoCopyWithImpl(this._self, this._then);

  final AudioResultsApiDto _self;
  final $Res Function(AudioResultsApiDto) _then;

/// Create a copy of AudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? predictions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,predictions: null == predictions ? _self.predictions : predictions // ignore: cast_nullable_to_non_nullable
as List<PredictionsApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioResultsApiDto].
extension AudioResultsApiDtoPatterns on AudioResultsApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioResultsApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioResultsApiDto value)  $default,){
final _that = this;
switch (_that) {
case _AudioResultsApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioResultsApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _AudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'result_id')  int id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'predictions', readValue: _readPredictions)  List<PredictionsApiDto> predictions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'result_id')  int id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'predictions', readValue: _readPredictions)  List<PredictionsApiDto> predictions)  $default,) {final _that = this;
switch (_that) {
case _AudioResultsApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'result_id')  int id, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'predictions', readValue: _readPredictions)  List<PredictionsApiDto> predictions)?  $default,) {final _that = this;
switch (_that) {
case _AudioResultsApiDto() when $default != null:
return $default(_that.id,_that.createdAt,_that.predictions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioResultsApiDto implements AudioResultsApiDto {
   _AudioResultsApiDto({@JsonKey(name: 'result_id') required this.id, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'predictions', readValue: _readPredictions) final  List<PredictionsApiDto> predictions = const <PredictionsApiDto>[]}): _predictions = predictions;
  factory _AudioResultsApiDto.fromJson(Map<String, dynamic> json) => _$AudioResultsApiDtoFromJson(json);

@override@JsonKey(name: 'result_id') final  int id;
@override@JsonKey(name: 'created_at') final  String? createdAt;
 final  List<PredictionsApiDto> _predictions;
@override@JsonKey(name: 'predictions', readValue: _readPredictions) List<PredictionsApiDto> get predictions {
  if (_predictions is EqualUnmodifiableListView) return _predictions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_predictions);
}


/// Create a copy of AudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioResultsApiDtoCopyWith<_AudioResultsApiDto> get copyWith => __$AudioResultsApiDtoCopyWithImpl<_AudioResultsApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioResultsApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioResultsApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._predictions, _predictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(_predictions));

@override
String toString() {
  return 'AudioResultsApiDto(id: $id, createdAt: $createdAt, predictions: $predictions)';
}


}

/// @nodoc
abstract mixin class _$AudioResultsApiDtoCopyWith<$Res> implements $AudioResultsApiDtoCopyWith<$Res> {
  factory _$AudioResultsApiDtoCopyWith(_AudioResultsApiDto value, $Res Function(_AudioResultsApiDto) _then) = __$AudioResultsApiDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'result_id') int id,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'predictions', readValue: _readPredictions) List<PredictionsApiDto> predictions
});




}
/// @nodoc
class __$AudioResultsApiDtoCopyWithImpl<$Res>
    implements _$AudioResultsApiDtoCopyWith<$Res> {
  __$AudioResultsApiDtoCopyWithImpl(this._self, this._then);

  final _AudioResultsApiDto _self;
  final $Res Function(_AudioResultsApiDto) _then;

/// Create a copy of AudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? predictions = null,}) {
  return _then(_AudioResultsApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,predictions: null == predictions ? _self._predictions : predictions // ignore: cast_nullable_to_non_nullable
as List<PredictionsApiDto>,
  ));
}


}


/// @nodoc
mixin _$PredictionsApiDto {

 String get label; double get score;
/// Create a copy of PredictionsApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PredictionsApiDtoCopyWith<PredictionsApiDto> get copyWith => _$PredictionsApiDtoCopyWithImpl<PredictionsApiDto>(this as PredictionsApiDto, _$identity);

  /// Serializes this PredictionsApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PredictionsApiDto&&(identical(other.label, label) || other.label == label)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,score);

@override
String toString() {
  return 'PredictionsApiDto(label: $label, score: $score)';
}


}

/// @nodoc
abstract mixin class $PredictionsApiDtoCopyWith<$Res>  {
  factory $PredictionsApiDtoCopyWith(PredictionsApiDto value, $Res Function(PredictionsApiDto) _then) = _$PredictionsApiDtoCopyWithImpl;
@useResult
$Res call({
 String label, double score
});




}
/// @nodoc
class _$PredictionsApiDtoCopyWithImpl<$Res>
    implements $PredictionsApiDtoCopyWith<$Res> {
  _$PredictionsApiDtoCopyWithImpl(this._self, this._then);

  final PredictionsApiDto _self;
  final $Res Function(PredictionsApiDto) _then;

/// Create a copy of PredictionsApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? score = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PredictionsApiDto].
extension PredictionsApiDtoPatterns on PredictionsApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PredictionsApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PredictionsApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PredictionsApiDto value)  $default,){
final _that = this;
switch (_that) {
case _PredictionsApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PredictionsApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _PredictionsApiDto() when $default != null:
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
case _PredictionsApiDto() when $default != null:
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
case _PredictionsApiDto():
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
case _PredictionsApiDto() when $default != null:
return $default(_that.label,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PredictionsApiDto implements PredictionsApiDto {
   _PredictionsApiDto({required this.label, required this.score});
  factory _PredictionsApiDto.fromJson(Map<String, dynamic> json) => _$PredictionsApiDtoFromJson(json);

@override final  String label;
@override final  double score;

/// Create a copy of PredictionsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PredictionsApiDtoCopyWith<_PredictionsApiDto> get copyWith => __$PredictionsApiDtoCopyWithImpl<_PredictionsApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PredictionsApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PredictionsApiDto&&(identical(other.label, label) || other.label == label)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,score);

@override
String toString() {
  return 'PredictionsApiDto(label: $label, score: $score)';
}


}

/// @nodoc
abstract mixin class _$PredictionsApiDtoCopyWith<$Res> implements $PredictionsApiDtoCopyWith<$Res> {
  factory _$PredictionsApiDtoCopyWith(_PredictionsApiDto value, $Res Function(_PredictionsApiDto) _then) = __$PredictionsApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, double score
});




}
/// @nodoc
class __$PredictionsApiDtoCopyWithImpl<$Res>
    implements _$PredictionsApiDtoCopyWith<$Res> {
  __$PredictionsApiDtoCopyWithImpl(this._self, this._then);

  final _PredictionsApiDto _self;
  final $Res Function(_PredictionsApiDto) _then;

/// Create a copy of PredictionsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? score = null,}) {
  return _then(_PredictionsApiDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ListAudioResultsApiDto {

 int get page; List<AudioResultsApiDto> get items;
/// Create a copy of ListAudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListAudioResultsApiDtoCopyWith<ListAudioResultsApiDto> get copyWith => _$ListAudioResultsApiDtoCopyWithImpl<ListAudioResultsApiDto>(this as ListAudioResultsApiDto, _$identity);

  /// Serializes this ListAudioResultsApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListAudioResultsApiDto&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ListAudioResultsApiDto(page: $page, items: $items)';
}


}

/// @nodoc
abstract mixin class $ListAudioResultsApiDtoCopyWith<$Res>  {
  factory $ListAudioResultsApiDtoCopyWith(ListAudioResultsApiDto value, $Res Function(ListAudioResultsApiDto) _then) = _$ListAudioResultsApiDtoCopyWithImpl;
@useResult
$Res call({
 int page, List<AudioResultsApiDto> items
});




}
/// @nodoc
class _$ListAudioResultsApiDtoCopyWithImpl<$Res>
    implements $ListAudioResultsApiDtoCopyWith<$Res> {
  _$ListAudioResultsApiDtoCopyWithImpl(this._self, this._then);

  final ListAudioResultsApiDto _self;
  final $Res Function(ListAudioResultsApiDto) _then;

/// Create a copy of ListAudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? items = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AudioResultsApiDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListAudioResultsApiDto].
extension ListAudioResultsApiDtoPatterns on ListAudioResultsApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListAudioResultsApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListAudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListAudioResultsApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ListAudioResultsApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListAudioResultsApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ListAudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  List<AudioResultsApiDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListAudioResultsApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  List<AudioResultsApiDto> items)  $default,) {final _that = this;
switch (_that) {
case _ListAudioResultsApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  List<AudioResultsApiDto> items)?  $default,) {final _that = this;
switch (_that) {
case _ListAudioResultsApiDto() when $default != null:
return $default(_that.page,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListAudioResultsApiDto implements ListAudioResultsApiDto {
   _ListAudioResultsApiDto({required this.page, required final  List<AudioResultsApiDto> items}): _items = items;
  factory _ListAudioResultsApiDto.fromJson(Map<String, dynamic> json) => _$ListAudioResultsApiDtoFromJson(json);

@override final  int page;
 final  List<AudioResultsApiDto> _items;
@override List<AudioResultsApiDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ListAudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListAudioResultsApiDtoCopyWith<_ListAudioResultsApiDto> get copyWith => __$ListAudioResultsApiDtoCopyWithImpl<_ListAudioResultsApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListAudioResultsApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListAudioResultsApiDto&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ListAudioResultsApiDto(page: $page, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ListAudioResultsApiDtoCopyWith<$Res> implements $ListAudioResultsApiDtoCopyWith<$Res> {
  factory _$ListAudioResultsApiDtoCopyWith(_ListAudioResultsApiDto value, $Res Function(_ListAudioResultsApiDto) _then) = __$ListAudioResultsApiDtoCopyWithImpl;
@override @useResult
$Res call({
 int page, List<AudioResultsApiDto> items
});




}
/// @nodoc
class __$ListAudioResultsApiDtoCopyWithImpl<$Res>
    implements _$ListAudioResultsApiDtoCopyWith<$Res> {
  __$ListAudioResultsApiDtoCopyWithImpl(this._self, this._then);

  final _ListAudioResultsApiDto _self;
  final $Res Function(_ListAudioResultsApiDto) _then;

/// Create a copy of ListAudioResultsApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? items = null,}) {
  return _then(_ListAudioResultsApiDto(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AudioResultsApiDto>,
  ));
}


}

// dart format on
