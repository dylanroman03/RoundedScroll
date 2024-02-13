/// A customizable rounded scrollable container widget with an icon that updates as you scroll.
/// Useful for modern UI designs in Flutter.
library rounded_scroll;

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

/// A scrollable container with rounded edges.
class RoundedScroll extends StatefulWidget {
  const RoundedScroll({
    required this.children,
    super.key,
    this.color,
    this.padding,
  });

  /// The widgets placed inside the scrollable container.
  final List<Widget> children;

  /// The background color of the container.
  final Color? color;

  /// The padding of the container.
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

    final scrollLine = ScrollLine(
      width: size.width,
      scrolling: scrolling,
      scrollingUp: scrollingUp,
    );

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        final List<bool> scrolls = onNotification(notification);

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

/// Widget representing the scroll line icon.
class ScrollLine extends StatelessWidget {
  const ScrollLine({
    required this.scrolling,
    required this.scrollingUp,
    required this.width,
    super.key,
  });

  /// Indicates whether scrolling is ongoing.
  final bool scrolling;

  /// Indicates whether scrolling is upward.
  final bool scrollingUp;

  /// The width of the scroll line.
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

/// Function to handle scroll notifications.
List<bool> onNotification(ScrollNotification notification) {
  final String e = notification.toString();
  var scrolling = false;
  var scrollingUp = false;

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
