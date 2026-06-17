import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class ConnectButton extends StatefulWidget {
  const ConnectButton({super.key});

  @override
  State<StatefulWidget> createState() => _ConnectButtonState();

}

class _ConnectButtonState extends State<ConnectButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final scale = isPressed
        ? 0.95
        : isHovered
        ? 1.01
        : 1.0;

    final translateY = isPressed
        ? 0.0
        : isHovered
        ? -1.0
        : 0.0;

    final animationDuration = 50;

    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() {
          isHovered = false;
          isPressed = false;
        }),
        child: InkWell(
          onTapDown: (_) => setState(() => isPressed = true),
          onTapUp: (_) => setState(() => isPressed = false),
          onTapCancel: () => setState(() => isPressed = false),
          onTap: () {
            launchUrl(Uri.parse('https://wa.me/03054200605'));
          },
          borderRadius: BorderRadius.circular(defaultPadding +10),
          child: AnimatedContainer(
              duration: Duration(milliseconds: animationDuration),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, translateY)
                ..scale(scale),
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                gradient: LinearGradient(colors: [
                  androidGreen,
                  flutterBlue,
                ]),
              boxShadow:[
                    BoxShadow(
                        color: androidGreen.withValues(
                          alpha: isHovered ? 0.8 : 0.4,
                        ),
                        offset: Offset(0, -1),
                        blurRadius: isHovered
                            ? defaultPadding / 2
                            : defaultPadding / 4),
                    BoxShadow(
                        color: flutterBlue.withValues(
                          alpha: isHovered ? 0.8 : 0.4,
                        ),
                        offset: Offset(0, 1),
                        blurRadius: isHovered
                            ? defaultPadding/2
                            : defaultPadding/4),
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedRotation(
                    duration: Duration(milliseconds: animationDuration),
                    turns: isHovered ? 0.10 : 0,
                    child: const FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,size: 15,)),
                const SizedBox(width : defaultPadding/4),
                Text('Whatsapp',style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold
                ),),
              ],
            )
          ),
        ),
      ),
    );
  }
}
