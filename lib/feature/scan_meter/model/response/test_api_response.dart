import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_api_response.freezed.dart';
part 'test_api_response.g.dart';

@immutable
@freezed
class TestAPIResponse with _$TestAPIResponse {
  const factory TestAPIResponse({
    @Default('') String message,
  }) = _TestAPIResponse;

  factory TestAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$TestAPIResponseFromJson(json);
}
