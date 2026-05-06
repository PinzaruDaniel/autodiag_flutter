import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/remote/index.dart';

part 'audio_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class AudioApiService {
  factory AudioApiService(Dio dio, {String baseUrl}) = _AudioApiService;

  @POST('/audio/send')
  @MultiPart()
  Future<AudioResultsApiDto> sendAudio(@Part(name: "audio") MultipartFile file);

  @GET('/audio/results')
  Future<ListAudioResultsApiDto> getResults(@Queries() Map<String, dynamic> queries);

  @GET('/audio/results/{results_id}')
  Future<AudioResultsApiDto> getResultById(@Path('results_id') int id);

  @DELETE('/audio/results')
  Future<void> deleteResults();
}