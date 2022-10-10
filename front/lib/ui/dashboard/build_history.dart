import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:front/providers/dashboard_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BuildHistory extends HookConsumerWidget {
  const BuildHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = useState('Build 1');
    final buildDetails = ref.watch(buildInfoProvider);
    final builds = ref.watch(buildsProvider);

    List<String> buildsList = ['Nothing to show'];
    return builds.when(data: (builds) {
      buildsList = builds.map((e) => 'Build ${e.id.toString()}').toList();
      buildsList = buildsList.isEmpty ? ['Nothing to show'] : buildsList;
      return Container(
        color: Colors.indigo,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: 30,
          right: 30,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Build History'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white70),
                ),
                const Spacer(),
                SizedBox(
                    height: 40,
                    width: 140,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        buttonHeight: 40,
                        buttonWidth: 140,
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        isExpanded: true,
                        hint: Text(
                          selectedValue.value,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 30,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        items: buildsList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedValue.value = value.toString();
                          ref
                              .read(selectedBuildId.notifier)
                              .update((state) => int.parse(value!));
                        },
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            buildDetails.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text(
                'No build info found. $err',
                style: TextStyle(color: Colors.white),
              ),
              data: (build) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Pull Request #3\n',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Cache composer files for builds',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                      height: 20, thickness: 1, color: Colors.white24),
                  Text(
                    build.commitMessage,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.commit, color: Colors.white70),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Commit ${build.commitId.substring(0, 7)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.code_rounded, color: Colors.white70),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Status: ${build.status}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.alt_route_rounded,
                          color: Colors.white70),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Branch ${build.branchName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white70),
                      padding: const EdgeInsets.all(20)),
                  child: Row(
                    children: [
                      const Icon(Icons.restart_alt_rounded),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Restart build'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }, error: (Object e, StackTrace? stack) {
      return Center(
          child: Text('ничего нету $e', style: TextStyle(color: Colors.white)));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
