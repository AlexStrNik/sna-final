import 'package:dio/dio.dart';
import 'package:front/models/build/build.dart';
import 'package:front/models/build/build_summary.dart';
import 'package:front/models/build/builds_response.dart';
import 'package:front/models/project/project.dart';
import 'package:front/models/project/project_summary.dart';
import 'package:front/models/project/projects_response.dart';
import 'package:front/models/stage/artifact.dart';
import 'package:front/models/stage/artifact_summary.dart';
import 'package:front/models/stage/artifacts_response.dart';
import 'package:front/models/stage/stage.dart';
import 'package:front/models/stage/stage_logs.dart';
import 'package:front/models/stage/stage_summary.dart';
import 'package:front/models/stage/stages_response.dart';
import 'package:front/providers/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final clientProvider = Provider((ref) {
  final secretToken = ref.read(authProvider).user!.token;
  print('secretToken: ${secretToken.toString()}');
  return Dio(BaseOptions(headers: {
    "token": secretToken,
  }, baseUrl: 'https://rultor.pro/api'));
});

final dashboardRepository =
    Provider<DashboardRepositoryAPI>((ref) => DashboardRepositoryAPI(ref.read));

abstract class DashboardRepository {
  Future<List<Project>> getProjects();
  Future<ProjectSummary> getStatsByProject(String projectId);
  Future<void> addWebhook(String projectId);
  Future<List<Build>> getBuilds(String projectId);
  Future<BuildSummary> getBuildById(String buildId);
  Future<List<Stage>> getStages(String runId);
  Future<StageSummary> getStageById(String stageId);
  Future<StageLogs> getStageLogs(String stageId);
  Future<List<Artifact>> getStageArtifacts(String stageId);
  Future<ArtifactSummary> getStageArtifactByPath(
      String stageId, String artifact_path);
}

class DashboardRepositoryAPI implements DashboardRepository {
  Reader read;
  DashboardRepositoryAPI(this.read);

  @override
  Future<List<Project>> getProjects({CancelToken? cancelToken}) async {
    try {
      final response =
          await read(clientProvider).get('/repos/', cancelToken: cancelToken);
      return (response.data as List).map((x) => Project.fromJson(x)).toList();
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<ProjectSummary> getStatsByProject(String projectId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await read(clientProvider)
          .get('/repos/$projectId', cancelToken: cancelToken);
      return ProjectSummary.fromJson(response.data);
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<void> addWebhook(String projectId) async {
    try {
      await read(clientProvider).post('/repos/$projectId/add-webhook');
      return;
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<List<Build>> getBuilds(String projectId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await read(clientProvider)
          .get('/repos/$projectId/runs', cancelToken: cancelToken);
      return (response.data as List).map((x) => Build.fromJson(x)).toList();
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<BuildSummary> getBuildById(String buildId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await read(clientProvider)
          .get('/runs/$buildId', cancelToken: cancelToken);
      return BuildSummary.fromJson(response.data);
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<List<Stage>> getStages(String runId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await read(clientProvider)
          .get('/runs/$runId/stages', cancelToken: cancelToken);
      print('getStages : $response');
      return (response.data as List).map((x) => Stage.fromJson(x)).toList();
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<StageSummary> getStageById(String stageId,
      {CancelToken? cancelToken}) async {
    try {
      final response =
          await ProviderContainer().read(clientProvider).get('/stages',
              queryParameters: {
                "stage_id": stageId,
              },
              cancelToken: cancelToken);
      return StageSummary.fromJson(response.data);
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<StageLogs> getStageLogs(String stageId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await ProviderContainer()
          .read(clientProvider)
          .get('/stages/$stageId/logs', cancelToken: cancelToken);
      return StageLogs.fromJson(response.data);
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<List<Artifact>> getStageArtifacts(String stageId,
      {CancelToken? cancelToken}) async {
    try {
      final response = await ProviderContainer()
          .read(clientProvider)
          .get('/stages/$stageId/artifacts', cancelToken: cancelToken);
      return (response.data as List).map((x) => Artifact.fromJson(x)).toList();
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }

  @override
  Future<ArtifactSummary> getStageArtifactByPath(
      String stageId, String artifact_path,
      {CancelToken? cancelToken}) async {
    try {
      final response = await ProviderContainer()
          .read(clientProvider)
          .get('/$stageId/artifacts/$artifact_path', cancelToken: cancelToken);
      return ArtifactSummary.fromJson(response.data);
    } on DioError catch (error) {
      //throw DataException.fromDioError(error);
      throw UnimplementedError(error.toString());
    }
  }
}
