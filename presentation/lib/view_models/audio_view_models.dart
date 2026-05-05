import 'package:domain/modules/audio/models/index.dart';

class PredictionVm {
  final String label;
  final double score;

  const PredictionVm({
    required this.label,
    required this.score,
  });
}

class AudioResultVm {
  final int id;
  final String? createdAt;
  final List<PredictionVm> predictions;

  const AudioResultVm({
    required this.id,
    required this.createdAt,
    required this.predictions,
  });
}

extension PredictionEntityVmMapper on PredictionEntity {
  PredictionVm toVm() {
    return PredictionVm(
      label: label,
      score: score,
    );
  }
}

extension AudioResultsEntityVmMapper on AudioResultsEntity {
  AudioResultVm toVm() {
    return AudioResultVm(
      id: id,
      createdAt: createdAt,
      predictions: predictions.map((prediction) => prediction.toVm()).toList(),
    );
  }
}

extension AudioResultsEntityListVmMapper on List<AudioResultsEntity> {
  List<AudioResultVm> toVms() {
    return map((item) => item.toVm()).toList();
  }
}

