import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/responsive.dart';

import 'package:front/providers/auth_provider.dart';
import 'package:front/providers/dashboard_provider.dart';
import 'package:front/ui/dashboard/build_history.dart';
import 'package:front/ui/dashboard/build_stages.dart';
import 'package:front/ui/dashboard/project_card.dart';
import 'package:front/ui/dashboard/statistics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});
  @override
  _RiverpodExampleState createState() => _RiverpodExampleState();
}

class _RiverpodExampleState extends ConsumerState<Dashboard> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;
  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsProvider);

    final user = ref.read(authProvider).user;
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: PopupMenuButton(
                            icon: CircleAvatar(
                              backgroundImage: NetworkImage(user!.avatarUrl),
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: '1',
                                  child: Text('Меню'),
                                ),
                                PopupMenuItem<String>(
                                  value: '2',
                                  child: Text('Меню'),
                                ),
                              ];
                            },
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Dashboard',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        Text(
                          'Projects',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'See all '.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_right_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: projects.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text(
                        'Error: $err',
                        style: const TextStyle(color: Colors.white),
                      ),
                      data: (projectList) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...projectList.map((e) => ProjectCard(() {
                                    _controllerCenter.play();
                                  }, project: e)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  Responsive.isDesktop(context)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: Row(
                            children: [
                              const Expanded(flex: 2, child: BuildHistory()),
                              const Expanded(flex: 2, child: Statistics()),
                              const Expanded(
                                flex: 2,
                                child: BuildStages(),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 1.5,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: const [
                              Expanded(flex: 2, child: BuildHistory()),
                              Expanded(flex: 2, child: Statistics()),
                              Expanded(
                                flex: 2,
                                child: BuildStages(),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't sRpecify a direction, blast randomly
                shouldLoop:
                    false, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
                createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
