import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/ui/common/on_drag_widget.dart';
import 'package:front/constants/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.only(left: 56, top: 24, right: 56, bottom: 24),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                semanticsLabel: 'Logo',
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'betterRultor.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'FAQ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Docs',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Integration',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Pricing',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async => await Utils.launchLogin(),
                child: Text(
                  'Login via Github',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                child: Center(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14))),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 240,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.30),
                child: const Center(
                  child: OnDragWidget(),
                ),
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        '\nautomate merge, deploy and release routine operations'
                            .toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.indigo),
                    children: [
                      TextSpan(
                        text: '\nYour DevOps Team ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                      ),
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Icon(
                            Icons.assignment_ind_rounded,
                            size: 36.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' Assistant,',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                      ),
                      TextSpan(
                        text: '\nbut it ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                      ),
                      const WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Icon(
                            Icons.flash_on_rounded,
                            size: 32.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' actually works.\n\n',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Say  ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      WidgetSpan(
                        child: DefaultTextStyle(
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  backgroundColor: Colors.black,
                                  color: Colors.white),
                          child: AnimatedTextKit(
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                TyperAnimatedText(
                                  ' @betterRultor hello ',
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ]),
                        ),
                      ),
                      TextSpan(
                          text: ' in a Github issue and start from there.',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
