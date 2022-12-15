import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/ui/common/on_drag_widget.dart';

class IntegrationTab extends StatelessWidget {
  const IntegrationTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '\nINTEGRATIONS',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.deepPurpleAccent),
            children: [
              TextSpan(
                text: '\nIntegrations to\n',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.black),
              ),
              TextSpan(
                text: 'power ',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.black),
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.alt_route_rounded,
                    size: 32.0,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              TextSpan(
                text: ' your development\n',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ],
          ),
        ),
        Text(
          'BetterRultor is super extensible and powerful in terms of integrations.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Yeah, BTW, every build runs in its own Docker container! :)',
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
