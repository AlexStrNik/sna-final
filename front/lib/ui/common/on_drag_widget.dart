import 'package:flutter/material.dart';
import 'package:front/ui/common/landing_custom_btn.dart';
import 'package:front/ui/common/on_tap_animation.dart';
import 'package:front/constants/utils.dart';

class OnDragWidget extends StatefulWidget {
  const OnDragWidget({
    super.key,
  });

  @override
  State<OnDragWidget> createState() => _OnDragWidgetState();
}

class _OnDragWidgetState extends State<OnDragWidget> {
  bool amIHovering = false;
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      amIHovering = true;
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      amIHovering = false;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
          Size(MediaQuery.of(context).size.width * 0.408, 70)),
      child: MouseRegion(
        onEnter: _incrementEnter,
        onHover: _updateLocation,
        onExit: _incrementExit,
        child: Stack(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: amIHovering
                    ? Theme.of(context).primaryColor.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 6.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(4.0),
                height: 60,
                child: Row(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 24.0, top: 12.0, bottom: 12.0),
                      child: Icon(
                        Icons.dashboard_customize_rounded,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 12.0, bottom: 12.0),
                      child: Text(
                        'Start working with BetterRultor...',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: OnTapOpacityContainer(
                        onTap: () async => await Utils.launchLogin(),
                        curve: Curves.ease,
                        child: ClipPath(
                          clipper: BackgroundClipper(),
                          child: Container(
                            color: Colors.blueAccent,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 32.0),
                                child: Text(
                                  'Get Started',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
