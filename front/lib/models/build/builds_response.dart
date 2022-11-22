import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/models/build/build.dart';

part 'builds_response.freezed.dart';
part 'builds_response.g.dart';

@freezed
abstract class BuildsResponse with _$BuildsResponse {
  const factory BuildsResponse({required List<Build> result}) = _BuildsResponse;

  factory BuildsResponse.fromJson(Map<String, dynamic> json) =>
      _$BuildsResponseFromJson(json);
}
