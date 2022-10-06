import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/models/stage/stage.dart';

part 'stages_response.freezed.dart';
part 'stages_response.g.dart';

@freezed
abstract class StagesResponse with _$StagesResponse {
  const factory StagesResponse({required List<Stage> result}) = _StagesResponse;

  factory StagesResponse.fromJson(Map<String, dynamic> json) =>
      _$StagesResponseFromJson(json);
}
