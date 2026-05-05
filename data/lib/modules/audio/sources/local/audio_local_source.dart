import 'package:data/modules/audio/models/local/audio_result_box.dart';
import 'package:data/objectbox.g.dart';

abstract class AudioLocalSource {
  Future<List<AudioResultBox>> getAllResults();

  Future<List<AudioResultBox>> getResultsByPage(int page);

  Future<void> saveResults(List<AudioResultBox> results);

  Future<void> saveResultsForPage(int page, List<AudioResultBox> results);

  Future<void> clearResults();
}

class AudioLocalSourceImpl implements AudioLocalSource {
  AudioLocalSourceImpl({
    required this.audioResultBox,
    required this.audioPredictionBox,
  });

  final Box<AudioResultBox> audioResultBox;
  final Box<AudioPredictionBox> audioPredictionBox;

  @override
  Future<List<AudioResultBox>> getAllResults() async {
    return audioResultBox.getAllAsync();
  }

  @override
  Future<List<AudioResultBox>> getResultsByPage(int page) async {
    final query = audioResultBox.query(AudioResultBox_.page.equals(page)).build();
    try {
      return query.findAsync();
    } finally {
      query.close();
    }
  }

  @override
  Future<void> saveResults(List<AudioResultBox> results) async {
    await saveResultsForPage(0, results);
  }

  @override
  Future<void> saveResultsForPage(int page, List<AudioResultBox> results) async {
    if (results.isEmpty) {
      return;
    }

    for (final result in results) {
      result.page = page;
    }

    final predictions = <AudioPredictionBox>[];
    for (final result in results) {
      for (final prediction in result.predictions) {
        prediction.audioResult.target = result;
        predictions.add(prediction);
      }
    }

    await audioResultBox.putManyAsync(results);
    if (predictions.isNotEmpty) {
      await audioPredictionBox.putManyAsync(predictions);
    }
  }

  @override
  Future<void> clearResults() async {
    await audioPredictionBox.removeAllAsync();
    await audioResultBox.removeAllAsync();
  }
}
