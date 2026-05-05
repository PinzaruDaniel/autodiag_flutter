import 'package:domain/modules/audio/use_cases/get_audio_results_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/view_models/audio_view_models.dart';

class HistoryController extends GetxController {
  HistoryController({
    GetAudioResultsUseCase? getAudioResultsUseCase,
  }) : _getAudioResultsUseCase = getAudioResultsUseCase ?? GetIt.instance<GetAudioResultsUseCase>();

  final GetAudioResultsUseCase _getAudioResultsUseCase;

  final RxList<AudioResultVm> results = <AudioResultVm>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isRefreshing = false.obs;
  final RxBool hasMore = true.obs;
  final RxInt currentPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitial();
  }

  Future<void> loadInitial() async {
    if (isLoading.value) {
      return;
    }

    isLoading.value = true;
    currentPage.value = 1;
    results.clear();
    hasMore.value = true;

    await _fetchPage(currentPage.value, forceRefresh: true);

    isLoading.value = false;
  }

  Future<void> loadNextPage() async {
    if (isLoading.value || !hasMore.value) {
      return;
    }

    isLoading.value = true;
    final nextPage = currentPage.value + 1;
    final loaded = await _fetchPage(nextPage);
    if (loaded) {
      currentPage.value = nextPage;
    }
    isLoading.value = false;
  }

  Future<void> refreshResults() async {
    if (isRefreshing.value) {
      return;
    }

    isRefreshing.value = true;
    await loadInitial();
    isRefreshing.value = false;
  }

  Future<bool> _fetchPage(int page, {bool forceRefresh = false}) async {
    final response = await _getAudioResultsUseCase(
      GetAudioResultsParams(page: page, forceRefresh: forceRefresh),
    );

    return response.fold(
      (failure) {
        hasMore.value = false;
        return false;
      },
      (entity) {
        if (entity.items.isEmpty) {
          hasMore.value = false;
          return false;
        }

        results.addAll(entity.items.toVms());
        return true;
      },
    );
  }
}
