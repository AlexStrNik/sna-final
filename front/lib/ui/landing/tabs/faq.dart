import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/ui/common/on_drag_widget.dart';

class FAQTab extends StatelessWidget {
  const FAQTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Configuration Reference\n',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        RichText(text: 'BetterRultor is configured through the ', children: [
          TextSpan(
              text: '.better-rultor.yaml',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text: ' file stored in the root directory of your repository.'),
        ]),
        Text(
            'However on custom installations file name can be configured via environment vars'),
        Text('There is management panel for secrets in dashboard,'),
        Text(
            'so there is no need to put them into another private Github repository and inform Rultor that he has to fetch it from there\n'),
        Text(
          '\nImage\n',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
            'You can specify Docker image for each stage independently or set default image at top-level of config'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Text(
            '''
            image: "alpine:latest"
            
            stages:
              install:
                image: "node:19"
            ''',
          ),
        ),
        Text(
          '\nStages\n',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        RichText(text: 'Each stage has  ', children: [
          TextSpan(
              text: 'steps', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' – array of commands to execute, optional '),
          TextSpan(
              text: 'artifacts', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  ' – array of files to be avaliable for download from dashboard and optional '),
          TextSpan(
              text: 'image', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  ' – name of docker image to be used for stage as described above'),
        ]),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Text(
            '''
            stages:
              build:
                steps:
                  - echo "test" > build
                artifacts:
                  - build
            ''',
          ),
        ),
        Text(
          '\nBranches\n',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text('List of branches which will trigger runs')
      ],
    );
  }
}
