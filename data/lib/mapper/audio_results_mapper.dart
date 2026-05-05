import 'package:data/modules/audio/models/local/audio_result_box.dart';
import 'package:data/modules/audio/models/remote/index.dart';
import 'package:domain/modules/audio/models/index.dart';

extension AudioResultsApiDtoMapper on AudioResultsApiDto {
  AudioResultBox toBox({required int page}) {
    final resultBox = AudioResultBox(id: id, page: page);
    resultBox.predictions.addAll(
      predictions.map(
        (prediction) => AudioPredictionBox(
          label: prediction.label,
          score: prediction.score,
        ),
      ),
    );
    return resultBox;
  }
}

extension ListAudioResultsApiDtoMapper on ListAudioResultsApiDto {
  List<AudioResultBox> toBoxes() {
    return items.map((item) => item.toBox(page: page)).toList();
  }
}

extension AudioResultsApiDtoEntityMapper on AudioResultsApiDto {
  AudioResultsEntity toEntity() {
    return AudioResultsEntity(
      id: id,
      createdAt: createdAt,
      predictions: predictions
          .map((prediction) => PredictionEntity(
                label: prediction.label,
                score: prediction.score,
              ))
          .toList(),
    );
  }
}

extension ListAudioResultsApiDtoEntityMapper on ListAudioResultsApiDto {
  ListAudioResultsEntity toEntity() {
    return ListAudioResultsEntity(
      page: page,
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}

extension AudioResultBoxEntityMapper on AudioResultBox {
  AudioResultsEntity toEntity() {
    return AudioResultsEntity(
      id: id,
      createdAt: null,
      predictions: predictions
          .map((prediction) => PredictionEntity(
                label: prediction.label,
                score: prediction.score,
              ))
          .toList(),
    );
  }
}

extension AudioResultsBoxListEntityMapper on List<AudioResultBox> {
  List<AudioResultsEntity> toEntities() {
    return map((item) => item.toEntity()).toList();
  }
}
