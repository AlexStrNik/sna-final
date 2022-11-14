import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FAQTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '\nshow me the code'.toUpperCase(),
                  style: GoogleFonts.overpass(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.orangeAccent),
                  children: [
                    TextSpan(
                      text: '\nA powerful ',
                      style: GoogleFonts.overpass(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                    const WidgetSpan(
                      child: Icon(
                        Icons.precision_manufacturing_rounded,
                        size: 56.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    TextSpan(
                      text: ' addition to your',
                      style: GoogleFonts.overpass(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nexisting CI/CD solution\n',
                      style: GoogleFonts.overpass(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text:
                          'BetterRultor is not a replacement.\nAlready works with Jenkins, Go, Travis, Drone, Snap, Codeship or Wercker.\n',
                      style: GoogleFonts.overpass(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 56.0),
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'Logo',
                  width: 64,
                  height: 64,
                ),
              ),
              Text(
                'Configuration Reference',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'BetterRultor is configured through the YAML ',
                    style: GoogleFonts.overpass(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' .better-rultor.yml ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            backgroundColor: Colors.black,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text:
                            ' file stored in the root directory of your Github repository. The file is mandatory, but all content is optional. This page contains a complete reference of YAML instructions in alphabetic order.\n',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'BTW, ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.orangeAccent),
                      ),
                      TextSpan(
                        text:
                            'on custom instalation file name can be configured via environment variables.',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.1),
                      border: Border.all(color: Colors.black),
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      " image: 'alpine:latest'\n stages: \n \t\t\t\t build:  \n \t\t\t\t\t\t\t\t steps: \n\t\t\t\t\t\t\t\t\t\t\t\t - echo 'test' > build \n\t\t\t\t\t\t\t\t artifacts:  \n\t\t\t\t\t\t\t\t\t\t\t\t - build",
                      style: GoogleFonts.courierPrime(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Docker :images',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                        'You can specify Docker image for each step independently through config YAML file ',
                    style: GoogleFonts.overpass(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'OR',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.orangeAccent),
                      ),
                      TextSpan(
                        text:
                            ' set default image at top-level of you repository ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: ' .better-rultor.yml ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            backgroundColor: Colors.black,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text:
                            ' file. Look the code examples below and get started.',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.1),
                      border: Border.all(color: Colors.black),
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      " image: 'alpine:latest'\n stages: \n \t\t\t\t install:  \n \t\t\t\t\t\t\t\t image: node:19",
                      style: GoogleFonts.courierPrime(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Job Script :stages ',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Each stage has ',
                    style: GoogleFonts.overpass(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'STEPS',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.orangeAccent),
                      ),
                      TextSpan(
                        text: ' - array of commands to execute, ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'OPTIONAL ARTIFACTS',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.orangeAccent),
                      ),
                      TextSpan(
                        text:
                            ' - array of files to be avaliable for download from dashboard and ',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'OPTIONAL IMAGE',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.orangeAccent),
                      ),
                      TextSpan(
                        text:
                            ' - name of docker image to be used for stage as described above.',
                        style: GoogleFonts.overpass(
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.1),
                      border: Border.all(color: Colors.black),
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      " image: 'alpine:latest'\n stages: \n \t\t\t\t build:  \n \t\t\t\t\t\t\t\t steps: \n\t\t\t\t\t\t\t\t\t\t\t\t - echo 'test' > build \n\t\t\t\t\t\t\t\t artifacts:  \n\t\t\t\t\t\t\t\t\t\t\t\t - build",
                      style: GoogleFonts.courierPrime(
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
