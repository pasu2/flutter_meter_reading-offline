import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meter_reading_app/core/loader/loader_controller.dart';
import 'package:meter_reading_app/feature/history/controller/state/history_state.dart';
import 'package:meter_reading_app/feature/history/usecase/delete_meter_reading_list_usecase.dart';
import 'package:meter_reading_app/feature/history/usecase/edit_meter_reading_list_usecase.dart';
import 'package:meter_reading_app/feature/history/usecase/get_meter_reading_list_usecase.dart';
import 'package:meter_reading_app/feature/scan_meter/model/request/meter_reading_request.dart';
import 'package:meter_reading_app/utils/util/date_format.dart';

final historyControllerProvider =
    StateNotifierProvider<HistoryController, HistoryState>(
  (ref) {
    final getMeterReadingListUsecase =
        ref.watch(getMeterReadingListUsecaseProvider);
    final deleteMeterReadingListUsecase =
        ref.watch(deleteMeterReadingListUsecaseProvider);
    final editMeterReadingUsecase = ref.watch(editMeterReadingUsecaseProvider);

    return HistoryController(
      ref,
      const HistoryState(),
      getMeterReadingListUsecase,
      deleteMeterReadingListUsecase,
      editMeterReadingUsecase,
    );
  },
);

class HistoryController extends StateNotifier<HistoryState> {
  final Ref _ref;
  final LoaderController _loader;
  final GetMeterReadingListUsecase _getMeterReadingListUsecase;
  final DeleteMeterReadingListUsecase _deleteMeterReadingListUsecase;
  final EditMeterReadingUsecase _editMeterReadingUsecase;

  HistoryController(
    this._ref,
    HistoryState state,
    this._getMeterReadingListUsecase,
    this._deleteMeterReadingListUsecase,
    this._editMeterReadingUsecase,
  )   : _loader = _ref.read(loaderControllerProvider.notifier),
        super(state);

  Future<void> setFormData({
    required String key,
    required dynamic value,
  }) async {
    state = state.copyWith(
      formData: {
        ...state.formData,
        ...{key: value},
      },
    );
  }

  Future<void> onGetHistory() async {
    _loader.onLoad();
    state = state.copyWith(
      meterReadingList: const AsyncValue.loading(),
    );

    final result = await _getMeterReadingListUsecase.execute(null);

    result.when((success) {
      state = state.copyWith(
        meterReadingList: AsyncValue.data(success),
      );
      _loader.onDismissLoad();
    }, (error) {
      state = state.copyWith(
        meterReadingList: const AsyncValue.data([]),
      );
      _loader.onDismissLoad();
    });
  }

  void onSearchMeterId(String meterId, DateTime? searchDate) async {
    state = state.copyWith(meterId: meterId, searchDate: searchDate);

    final meterReadingList = state.meterReadingList.value;

    if (meterReadingList == null) return;

    final searchMeterReadingList = meterReadingList.where((e) {
      final createAt =
          _ref.read(baseDateFormatterProvider).formatDate(e.createAt);
      String _searchDate =
          _ref.read(baseDateFormatterProvider).formatDate(DateTime.now());
      if (searchDate != null) {
        _searchDate =
            _ref.read(baseDateFormatterProvider).formatDate(searchDate);
      }

      return searchDate != null
          ? createAt == _searchDate
          : e.meterId.contains(
              meterId,
            );
    }).toList();

    state = state.copyWith(searchMeterReadingList: searchMeterReadingList);
  }

  void onClearMeterId() {
    state = state.copyWith(meterId: null, searchDate: null);
  }

  Future<bool> onDeleteMeterReading(String id) async {
    bool isSuccess = false;
    _loader.onLoad();

    final result = await _deleteMeterReadingListUsecase
        .execute(MeterReadingRequest(id: id));

    result.when((success) {
      _loader.onDismissLoad();
      isSuccess = success;
    }, (error) => _loader.onDismissLoad());

    return isSuccess;
  }

  Future<bool> onEditMeterReading({
    String? meterImgPath,
    String? meterReading,
    String? meterId,
    String? id,
  }) async {
    bool isSuccess = false;
    _loader.onLoad();

    final result = await _editMeterReadingUsecase.execute(MeterReadingRequest(
      id: id,
      imgPath: meterImgPath,
      meterId: meterId,
      meterReading: meterReading,
    ));

    result.when((success) {
      _loader.onDismissLoad();
      isSuccess = success;
    }, (error) => _loader.onDismissLoad());

    return isSuccess;
  }
}
