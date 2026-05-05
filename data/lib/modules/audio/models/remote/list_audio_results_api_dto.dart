part of 'index.dart';

@freezed
abstract class ListAudioResultsApiDto with _$ListAudioResultsApiDto {
  factory ListAudioResultsApiDto({
    required int page,
    required List<AudioResultsApiDto> items,
  }) = _ListAudioResultsApiDto;

  factory ListAudioResultsApiDto.fromJson(Map<String, dynamic> json) => _$ListAudioResultsApiDtoFromJson(json);
}
