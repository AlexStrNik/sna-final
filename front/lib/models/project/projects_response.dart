import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/models/project/project.dart';

part 'projects_response.freezed.dart';
part 'projects_response.g.dart';

@freezed
abstract class ProjectsResponse with _$ProjectsResponse {
  const factory ProjectsResponse({required List<Project> result}) =
      _ProjectsResponse;

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseFromJson(json);
}
