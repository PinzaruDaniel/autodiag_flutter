part of 'index.dart';

@freezed
abstract class PredictionsApiDto with _$PredictionsApiDto {
  factory PredictionsApiDto({
    required String label,
    required double score
})= _PredictionsApiDto;
  factory PredictionsApiDto.fromJson(Map<String, dynamic> json) => _$PredictionsApiDtoFromJson(json);
}
