part of 'index.dart';

@freezed
abstract class AudioResultsEntity with _$AudioResultsEntity {
  factory AudioResultsEntity({
    required int id,
    String? createdAt,
    required List<PredictionEntity> predictions,
  }) = _AudioResultsEntity;
}