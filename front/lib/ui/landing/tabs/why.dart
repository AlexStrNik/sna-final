import 'package:flutter/material.dart';

class WhyTab extends StatelessWidget {
  const WhyTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '\nwhy not original rultor?'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.redAccent),
            children: [
              TextSpan(
                text: '\nRultor solution ',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.black),
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(
                    Icons.block_rounded,
                    size: 32.0,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              TextSpan(
                text: ' sucks.',
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
