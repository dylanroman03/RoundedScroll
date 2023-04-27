library rounded_scroll;

import 'package:flutter/material.dart';

import 'scroll_line.dart';

class RoundedScroll extends StatefulWidget {
  final List<Widget> children;
  final Color backColor;
  final EdgeInsetsGeometry? padding;

  const RoundedScroll({
    Key? key,
    required this.children,
    this.backColor = Colors.white,
    this.padding,
  }) : super(key: key);

  @override
  State<RoundedScroll> createState() => _RoundedScrollState();
}

class _RoundedScrollState extends State<RoundedScroll> {
  bool scrolling = false;
  bool scrollingUp = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        padding: widget.padding ?? EdgeInsets.only(top: size.height * 0.45),
        child: Container(
          decoration: BoxDecoration(
            color: widget.backColor,
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
