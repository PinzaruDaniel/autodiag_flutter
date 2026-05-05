import 'package:objectbox/objectbox.dart';

@Entity()
class AudioResultBox {
  @Id(assignable: true)
  int id;
  int page;
  final predictions = ToMany<AudioPredictionBox>();

  AudioResultBox({this.id = 0, this.page = 0});
}

@Entity()
class AudioPredictionBox {
  @Id()
  int id;
  String label;
  double score;
  final audioResult = ToOne<AudioResultBox>();

  AudioPredictionBox({
    this.id = 0,
    required this.label,
    required this.score,
  });
}
