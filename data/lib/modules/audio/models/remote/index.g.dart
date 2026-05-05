// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioResultsApiDto _$AudioResultsApiDtoFromJson(Map<String, dynamic> json) =>
    _AudioResultsApiDto(
      id: (json['result_id'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      predictions:
          (_readPredictions(json, 'predictions') as List<dynamic>?)
              ?.map(
                (e) => PredictionsApiDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <PredictionsApiDto>[],
    );

Map<String, dynamic> _$AudioResultsApiDtoToJson(_AudioResultsApiDto instance) =>
    <String, dynamic>{
      'result_id': instance.id,
      'created_at': instance.createdAt,
      'predictions': instance.predictions,
    };

_PredictionsApiDto _$PredictionsApiDtoFromJson(Map<String, dynamic> json) =>
    _PredictionsApiDto(
      label: json['label'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$PredictionsApiDtoToJson(_PredictionsApiDto instance) =>
    <String, dynamic>{'label': instance.label, 'score': instance.score};

_ListAudioResultsApiDto _$ListAudioResultsApiDtoFromJson(
  Map<String, dynamic> json,
) => _ListAudioResultsApiDto(
  page: (json['page'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => AudioResultsApiDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ListAudioResultsApiDtoToJson(
  _ListAudioResultsApiDto instance,
) => <String, dynamic>{'page': instance.page, 'items': instance.items};
