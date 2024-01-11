library rounded_scroll;

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RoundedScroll extends StatefulWidget {
  const RoundedScroll({
    required this.children,
    super.key,
    this.color,
    this.padding,
  });
  final List<Widget> children;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  State<RoundedScroll> createState() => _RoundedScrollState();
}

class _RoundedScrollState extends State<RoundedScroll> {
  bool scrolling = false;
  bool scrollingUp = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    var scrollLine = ScrollLine(
      width: size.width,
      scrolling: scrolling,
      scrollingUp: scrollingUp,
    );

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        List scrolls = onNotification(
          notification,
          scrolling,
          scrollingUp,
        );

        setState(() {
          scrolling = scrolls[0];
          scrollingUp = scrolls[1];
        });

        return true;
      },
      child: SingleChildScrollView(
        padding: widget.padding,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              scrollLine,
              ...widget.children,
            ],
          ),
        ),
      ),
    );
  }
}

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
