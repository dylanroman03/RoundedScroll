import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ScrollLine extends StatelessWidget {
  const ScrollLine({
    Key? key,
    required this.scrolling,
    required this.scrollingUp,
    required this.width,
  }) : super(key: key);

  final bool scrolling;
  final bool scrollingUp;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      height: 30,
      width: width,
      alignment: Alignment.topCenter,
      child: scrolling
          ? scrollingUp
              ? const Icon(
                  LineAwesomeIcons.angle_up,
                  size: 30,
                )
              : const Icon(
                  LineAwesomeIcons.angle_down,
                  size: 30,
                )
          : const Icon(
              LineAwesomeIcons.minus,
              size: 35,
            ),
    );
  }
}

List<dynamic> onNotification(notification, scrolling, scrollingUp) {
  String e = notification.toString();

  if (e.contains('ScrollDirection.reverse')) {
    scrolling = true;
    scrollingUp = true;
  } else if (e.contains('ScrollDirection.forward')) {
    scrolling = true;
    scrollingUp = false;
  } else if (e.contains('ScrollEndNotification')) {
    scrolling = false;
    scrollingUp = false;
  }

  return [scrolling, scrollingUp];
}
