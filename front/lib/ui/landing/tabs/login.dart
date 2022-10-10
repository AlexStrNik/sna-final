import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:front/ui/common/on_drag_widget.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.43),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(14))),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 240,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
          child: const OnDragWidget(),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '\nautomate merge, deploy and release routine operations'
                .toUpperCase(),
            style: GoogleFonts.overpass(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.indigo),
            children: [
              TextSpan(
                text: '\nYour DevOps Team ',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Icon(
                    Icons.assignment_ind_rounded,
                    size: 56.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              TextSpan(
                text: ' Assistant,',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              TextSpan(
                text: '\nbut it ',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              const WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Icon(
                    Icons.flash_on_rounded,
                    size: 56.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              TextSpan(
                text: ' actually works.\n',
                style: GoogleFonts.arvo(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Say  ',
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              WidgetSpan(
                child: DefaultTextStyle(
                  style: GoogleFonts.overpass(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
                style: GoogleFonts.overpass(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }
}
