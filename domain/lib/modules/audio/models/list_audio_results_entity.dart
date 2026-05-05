part of 'index.dart';

@freezed
abstract class ListAudioResultsEntity with _$ListAudioResultsEntity {
  factory ListAudioResultsEntity({
    required int page,
    required List<AudioResultsEntity> items,
  }) = _ListAudioResultsEntity;
}

