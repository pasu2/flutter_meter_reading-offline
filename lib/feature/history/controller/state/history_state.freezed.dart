// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryState {
  Map<String, dynamic> get formData => throw _privateConstructorUsedError;
  AsyncValue<List<MeterReadingResponse>?> get meterReadingList =>
      throw _privateConstructorUsedError;
  List<MeterReadingResponse> get searchMeterReadingList =>
      throw _privateConstructorUsedError;
  String? get meterId => throw _privateConstructorUsedError;
  DateTime? get searchDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {Map<String, dynamic> formData,
      AsyncValue<List<MeterReadingResponse>?> meterReadingList,
      List<MeterReadingResponse> searchMeterReadingList,
      String? meterId,
      DateTime? searchDate});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? meterReadingList = null,
    Object? searchMeterReadingList = null,
    Object? meterId = freezed,
    Object? searchDate = freezed,
  }) {
    return _then(_value.copyWith(
      formData: null == formData
          ? _value.formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      meterReadingList: null == meterReadingList
          ? _value.meterReadingList
          : meterReadingList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MeterReadingResponse>?>,
      searchMeterReadingList: null == searchMeterReadingList
          ? _value.searchMeterReadingList
          : searchMeterReadingList // ignore: cast_nullable_to_non_nullable
              as List<MeterReadingResponse>,
      meterId: freezed == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchDate: freezed == searchDate
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> formData,
      AsyncValue<List<MeterReadingResponse>?> meterReadingList,
      List<MeterReadingResponse> searchMeterReadingList,
      String? meterId,
      DateTime? searchDate});
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formData = null,
    Object? meterReadingList = null,
    Object? searchMeterReadingList = null,
    Object? meterId = freezed,
    Object? searchDate = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      meterReadingList: null == meterReadingList
          ? _value.meterReadingList
          : meterReadingList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MeterReadingResponse>?>,
      searchMeterReadingList: null == searchMeterReadingList
          ? _value._searchMeterReadingList
          : searchMeterReadingList // ignore: cast_nullable_to_non_nullable
              as List<MeterReadingResponse>,
      meterId: freezed == meterId
          ? _value.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchDate: freezed == searchDate
          ? _value.searchDate
          : searchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(
      {final Map<String, dynamic> formData = const {},
      this.meterReadingList = const AsyncValue.loading(),
      final List<MeterReadingResponse> searchMeterReadingList = const [],
      this.meterId,
      this.searchDate})
      : _formData = formData,
        _searchMeterReadingList = searchMeterReadingList;

  final Map<String, dynamic> _formData;
  @override
  @JsonKey()
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  @JsonKey()
  final AsyncValue<List<MeterReadingResponse>?> meterReadingList;
  final List<MeterReadingResponse> _searchMeterReadingList;
  @override
  @JsonKey()
  List<MeterReadingResponse> get searchMeterReadingList {
    if (_searchMeterReadingList is EqualUnmodifiableListView)
      return _searchMeterReadingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchMeterReadingList);
  }

  @override
  final String? meterId;
  @override
  final DateTime? searchDate;

  @override
  String toString() {
    return 'HistoryState(formData: $formData, meterReadingList: $meterReadingList, searchMeterReadingList: $searchMeterReadingList, meterId: $meterId, searchDate: $searchDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.meterReadingList, meterReadingList) ||
                other.meterReadingList == meterReadingList) &&
            const DeepCollectionEquality().equals(
                other._searchMeterReadingList, _searchMeterReadingList) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.searchDate, searchDate) ||
                other.searchDate == searchDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_formData),
      meterReadingList,
      const DeepCollectionEquality().hash(_searchMeterReadingList),
      meterId,
      searchDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
      {final Map<String, dynamic> formData,
      final AsyncValue<List<MeterReadingResponse>?> meterReadingList,
      final List<MeterReadingResponse> searchMeterReadingList,
      final String? meterId,
      final DateTime? searchDate}) = _$HistoryStateImpl;

  @override
  Map<String, dynamic> get formData;
  @override
  AsyncValue<List<MeterReadingResponse>?> get meterReadingList;
  @override
  List<MeterReadingResponse> get searchMeterReadingList;
  @override
  String? get meterId;
  @override
  DateTime? get searchDate;
  @override
  @JsonKey(ignore: true)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
