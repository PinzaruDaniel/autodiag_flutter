import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/history_controller.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/text_styles.dart';
import 'package:presentation/utils/widgets/circular_progress_indicator_widget.dart';
import 'package:presentation/utils/widgets/loading_overlay_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late final HistoryController _controller;
  late final RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(HistoryController());
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await _controller.refreshResults();
    _refreshController.refreshCompleted();
    if (_controller.hasMore.value) {
      _refreshController.resetNoData();
    } else {
      _refreshController.loadNoData();
    }
  }

  Future<void> _onLoading() async {
    await _controller.loadNextPage();
    if (_controller.hasMore.value) {
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  String _formatCreatedAt(String? createdAt) {
    if (createdAt == null || createdAt.trim().isEmpty) {
      return 'Unknown date';
    }
    final parsed = DateTime.tryParse(createdAt);
    if (parsed == null) {
      return createdAt;
    }
    final local = parsed.toLocal();
    String twoDigits(int value) => value.toString().padLeft(2, '0');
    return '${local.year}-${twoDigits(local.month)}-${twoDigits(local.day)} '
        '${twoDigits(local.hour)}:${twoDigits(local.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16.w),
      child: Obx(() {
        if (_controller.isLoading.value && _controller.results.isEmpty) {
          return const Center(child: LoadingOverlayWidget());
        }

        if (_controller.results.isEmpty) {
          return Center(child: Text('No results yet', style: TextStyles.baseTextStyle));
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          header: const WaterDropHeader(),
          footer: CustomFooter(
            builder: (context, mode) {
              if (mode == LoadStatus.loading) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: const Center(child: CircularProgressIndicatorWidget(boxConstraints: BoxConstraints(minHeight: 30, minWidth: 30))),
                );
              }
              return SizedBox(height: 24.h);
            },
          ),
          child: ListView.builder(
            itemCount: _controller.results.length,
            itemBuilder: (context, index) {
              final result = _controller.results[index];
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.onBackground,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatCreatedAt(result.createdAt),
                      style: TextStyles.whiteBold(fontSize: 16.sp),
                    ),
                    8.verticalSpace,
                    ...result.predictions
                        .take(3)
                        .map(
                          (prediction) => Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(prediction.label, style: TextStyles.baseTextStyle)),
                                Text(
                                  '${(prediction.score * 100).toStringAsFixed(1)}%',
                                  style: TextStyles.baseTextStyle.copyWith(color: AppColors.secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
