part of 'index.dart';

Object? _readPredictions(Map<dynamic, dynamic> json, String key) {
  final direct = json[key];
  if (direct is List) {
    return direct;
  }
  final classification = json['classification'];
  if (classification is Map && classification['predictions'] is List) {
    return classification['predictions'];
  }
  return const <dynamic>[];
}

@freezed
abstract class AudioResultsApiDto with _$AudioResultsApiDto {
  factory AudioResultsApiDto({
    @JsonKey(name: 'result_id') required int id,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'predictions', readValue: _readPredictions)
    @Default(<PredictionsApiDto>[]) List<PredictionsApiDto> predictions,
  }) = _AudioResultsApiDto;

  factory AudioResultsApiDto.fromJson(Map<String, dynamic> json) => _$AudioResultsApiDtoFromJson(json);
}
