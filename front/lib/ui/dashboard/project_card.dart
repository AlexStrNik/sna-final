import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front/models/project/project.dart';
import 'package:front/providers/dashboard_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProjectCard extends HookConsumerWidget {
  final Project project;
  final void Function()? onPressed;
  const ProjectCard(this.onPressed, {Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final random = Random();
    final cardColor = useState(Colors.black);
    final squareColor = useState(Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    ));
    final fontColor = useState(Colors.white);
    final cardShadow = useState(Colors.white10);
    final decorationsColor = useState(Colors.white24);

    ref.read(selectedProjectId.notifier).addListener((state) {
      if (state == project.id) {
        cardColor.value = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        //cardShadow.value = Colors.black12;

        decorationsColor.value = Colors.black;
        fontColor.value = Colors.black;
        squareColor.value = Colors.black;
      } else {
        cardColor.value = Colors.black;
        squareColor.value = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        fontColor.value = Colors.white;
        cardShadow.value = Colors.white10;
        decorationsColor.value = Colors.white24;
      }
    });
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.only(right: 30.0),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                ref
                    .read(selectedProjectId.notifier)
                    .update((state) => project.id);
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cardShadow.value,
                    ),
                    BoxShadow(
                      color: cardColor.value,
                      spreadRadius: -12.0,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                duration: const Duration(seconds: 1),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.square,
                          color: squareColor.value,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          project.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: fontColor.value),
                        ),
                      ],
                    ),
                    Divider(
                        height: 20,
                        thickness: 1,
                        color: decorationsColor.value),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: '310h\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(color: fontColor.value),
                                children: [
                                  TextSpan(
                                    text: 'logged',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: fontColor.value
                                                .withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                              width: 20,
                              thickness: 1,
                              color: decorationsColor.value),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                text: '340h\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(color: fontColor.value),
                                children: [
                                  TextSpan(
                                    text: 'estimated',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color:
                                              fontColor.value.withOpacity(0.7),
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    LinearProgressIndicator(
                      key: UniqueKey(),
                      value: 10,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'created at\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color:
                                            fontColor.value.withOpacity(0.7)),
                                children: [
                                  TextSpan(
                                    text: project.createdAt,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: fontColor.value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                text: 'recent activity\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color:
                                            fontColor.value.withOpacity(0.7)),
                                children: [
                                  TextSpan(
                                    text: project.pushedAt,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: fontColor.value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed: !project.webhookActive
                          ? () {
                              ref.read(webhookProvider.notifier).activate();
                              onPressed!.call();
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: decorationsColor.value),
                          padding: const EdgeInsets.all(20)),
                      child: Text(
                        !project.webhookActive
                            ? 'Add Webhook'.toUpperCase()
                            : "Webhook enabled",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: fontColor.value),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu_rounded),
                      color: fontColor.value,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
