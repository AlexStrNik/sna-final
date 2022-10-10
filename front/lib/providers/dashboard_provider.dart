import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/models/build/build.dart';
import 'package:front/models/build/build_summary.dart';
import 'package:front/models/project/project.dart';
import 'package:front/models/project/project_summary.dart';
import 'package:front/models/stage/stage.dart';
import 'package:front/repository/dashboard_repository.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  List<Project> projects = await ref.read(dashboardRepository).getProjects();
  return projects;
});

final projectStatsProvider = FutureProvider<ProjectSummary>((ref) async {
  final id = ref.watch(selectedProjectId);
  final stats =
      await ref.read(dashboardRepository).getStatsByProject(id.toString());
  await Future.delayed(const Duration(seconds: 2));
  return stats;
});

final selectedProjectId = StateProvider<int>((ref) => 579724966);

final selectedBuildId = StateProvider<int>((ref) => 1);

final buildsProvider = FutureProvider<List<Build>>((ref) async {
  List<Build> builds = [];
  final id = ref.watch(selectedProjectId);
  builds = await ref.read(dashboardRepository).getBuilds(id.toString());
  return builds;
});

final buildInfoProvider = FutureProvider<BuildSummary>((ref) async {
  final id = ref.watch(selectedBuildId);
  final build = await ref.read(dashboardRepository).getBuildById(id.toString());
  await Future.delayed(const Duration(seconds: 2));
  return build;
});

final webhookActivationProvider = Provider<void>((ref) async {
  final projectId = ref.watch(selectedProjectId.notifier).state;
  await ref.read(dashboardRepository).addWebhook(projectId.toString());
  return;
});

class WebhookNotifier extends StateNotifier<bool> {
  Reader read;
  WebhookNotifier(this.read) : super(false);
  void activate() async {
    final projectId = read(selectedProjectId.notifier).state;
    await read(dashboardRepository).addWebhook(projectId.toString());
  }
}

final webhookProvider = StateNotifierProvider<WebhookNotifier, bool>((ref) {
  return WebhookNotifier(ref.read);
});

final stagesProvider = FutureProvider<List<Stage>>((ref) async {
  List<Stage> stages = [];
  final id = ref.watch(selectedBuildId);
  stages = await ref.read(dashboardRepository).getStages(id.toString());
  return stages;
});
