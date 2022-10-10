import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/constants/utils.dart';
import 'package:front/ui/landing/tabs/docs.dart';
import 'package:front/ui/landing/tabs/faq.dart';
import 'package:front/ui/landing/tabs/integration.dart';
import 'package:front/ui/landing/tabs/login.dart';
import 'package:front/ui/landing/tabs/why.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              InkWell(
                onTap: () => _controller.animateTo(0),
                child: Text(
                  'betterRultor.',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _controller.animateTo(1),
                child: Text(
                  'FAQ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () async => await Utils.launchDocs(),
                child: Text(
                  'Docs',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () => _controller.animateTo(2),
                child: Text(
                  'Integration',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () => _controller.animateTo(3),
                child: Text(
                  'Why this?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () async => await Utils.launchDocs(),
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: _controller,
              children: [
                const LoginTab(),
                FAQTab(),
                const IntegrationTab(),
                const WhyTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
