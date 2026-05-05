part of 'index.dart';

@freezed
abstract class PredictionEntity with _$PredictionEntity {
  factory PredictionEntity({
    required String label,
    required double score
  })= _PredictionEntity;
}